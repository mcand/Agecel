//
//  AGLContactDB.m
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLContactDB.h"
#import "AGLContact.h"

@implementation AGLContactDB

// Retorna o SQL para criar um contato
-(NSString *)getSQLCreate{
  NSString *sql = @"create table if not exists contact (id_contact integer primary key autoincrement, id_establishment integer, phone text, email text, foreign key(id_establishment) references establishment(id_establishment) on delete cascade);";
  return sql;
}

// Salva um novo contato ou atualiza um já existe pelo id
-(void) saveContact:(AGLContact *)contact{
  char *sql = "insert or replace into contact (id_contact, id_establishment, phone, email) values (?, ?, ?, ?);";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if(resultado == SQLITE_OK){
    //se for nulo insere, senão atualiza
    if(contact.idContact > 0){
      //informa o id para fazer o update
      sqlite3_bind_int(stmt, 1, contact.idContact);
    }
    sqlite3_bind_int(stmt, 2, contact.idEstablishment);
    sqlite3_bind_text(stmt, 3, [contact.phone UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 4, [contact.email UTF8String], -1, nil);

    //executa o sql
    resultado = sqlite3_step(stmt);
    
    if (resultado == SQLITE_DONE) {
      NSLog(@"Contato inserido com sucesso");
    }
    sqlite3_finalize(stmt);
  }else{
    NSLog(@"Erro ao inserir o contato!");
  }

}

// Deleta todos os contatos
-(void) deleteContacts{
  char *sql = "delete from contact;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_DONE) {
    NSLog(@"Todos os dados da tabela contact foram deletados com sucesso!");
  }
  sqlite3_finalize(stmt);
}

// Retorna todos os tipos de estabelecimento de uma cidade
-(NSMutableArray *) getContactsFromEstablishment:(AGLEstablishment *)establishment{
  // Array que vai armazenar a lista de tipos de estabelecimento
  NSMutableArray *contacts = [[NSMutableArray alloc] init];
  // SQL para selecionar as cidades
  NSString *query = @"select id_contact, id_establishment, phone, email from contact where id_establishment = ? order by id_contact;";
  sqlite3_stmt *stmt;
  // cria o stmt
  int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    sqlite3_bind_int(stmt, 1, establishment.idEstablishment);
    while (sqlite3_step(stmt) == SQLITE_ROW) {
      AGLContact *contact = [[AGLContact alloc] init];
      contact.idContact = sqlite3_column_int(stmt, 0);
      contact.idEstablishment = sqlite3_column_int(stmt, 1);
      char *row = (char *)sqlite3_column_text(stmt, 2);
      NSString *telephone = [[NSString alloc]init];
      telephone = row != nil ? [NSString stringWithUTF8String:row] : nil;
      contact.phone = telephone;
      row = (char *)sqlite3_column_text(stmt, 3);
      NSString *email = [[NSString alloc] init];
      email = row != nil ? [NSString stringWithUTF8String:row] : nil;
      contact.email = email;
      [contacts addObject:contact];
    }
    // Finaliza o cursor
    sqlite3_finalize(stmt);
  }
  return contacts;
}

@end
