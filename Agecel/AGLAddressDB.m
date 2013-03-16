//
//  AGLAddressDB.m
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLAddressDB.h"

@implementation AGLAddressDB

// Retorna o SQL para criar um endereco
-(NSString *)getSQLCreate {
  NSString *sql = @"create table if not exists address (id_address integer primary key autoincrement, foreign key(id_establishment) references establishment(id_establishment) on delete cascade, street text, zip text, complement text, number integer, neighborhood text);";
  return sql;
}

// Salva um novo endereco ou atualiza um já existe pelo id
-(void) saveAddress:(AGLAddress *)address {
  char *sql = "insert or replace into contact (id_address, id_establishment, street, zip, complement, number, neighborhood) values (?, ?, ?, ?, ?, ?, ?);";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if(resultado == SQLITE_OK){
    //se for nulo insere, senão atualiza
    if(address.idAddress > 0){
      //informa o id para fazer o update
      sqlite3_bind_int(stmt, 1, address.idAddress);
    }
    sqlite3_bind_int(stmt, 2, address.idEstablishment);
    sqlite3_bind_text(stmt, 3, [address.street UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 4, [address.zip UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 5, [address.complement UTF8String], -1, nil);
    sqlite3_bind_int(stmt, 6, address.number);
    sqlite3_bind_text(stmt, 7, [address.neighborhood UTF8String], -1, nil);
    
    //executa o sql
    resultado = sqlite3_step(stmt);
    
    if (resultado == SQLITE_DONE) {
      NSLog(@"Endereco inserido com sucesso");
    }
    sqlite3_finalize(stmt);
  }else{
    NSLog(@"Erro ao inserir o endereco");
  }

}

// Deleta todos os enderecos
-(void) deleteAddress{
  char *sql = "delete from address;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_DONE) {
    NSLog(@"Tabela Address deletada com sucesso!");
  }
  sqlite3_finalize(stmt);
}

// Retorna todos os enderecos de um estabelecimento
-(NSMutableArray *) getAddressesFromEstablishment:(AGLEstablishment *)establishment {
  // Array que vai armazenar a lista de tipos de estabelecimento
  NSMutableArray *addresses = [[NSMutableArray alloc] init];
  // SQL para selecionar as cidades
  NSString *query = @"select id_address, id_establishment, street, zip, complement, number, neighborhood from address where id_establishment = ? order by id_address;";
  sqlite3_stmt *stmt;
  // cria o stmt
  int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    sqlite3_bind_int(stmt, 1, establishment.idEstablishment);
    while (sqlite3_step(stmt) == SQLITE_ROW) {
      AGLAddress *address = [[AGLAddress alloc] init];
      address.idAddress = sqlite3_column_int(stmt, 0);
      address.idEstablishment = sqlite3_column_int(stmt, 1);
      char *row = (char *)sqlite3_column_text(stmt, 2);
      NSString *street = [[NSString alloc]init];
      street = row != nil ? [NSString stringWithUTF8String:row] : nil;
      address.street = street;
      row = (char *)sqlite3_column_text(stmt, 3);
      NSString *zip = [[NSString alloc] init];
      zip = row != nil ? [NSString stringWithUTF8String:row] : nil;
      address.zip = zip;
      row = (char *)sqlite3_column_text(stmt, 4);
      NSString *complement = [[NSString alloc]init];
      complement = row != nil ? [NSString stringWithUTF8String:row] : nil;
      address.complement = complement;
      address.number = sqlite3_column_int(stmt, 5);
      row = (char *)sqlite3_column_text(stmt, 6);
      NSString *neighborhood = [[NSString alloc] init];
      neighborhood = row != nil ? [NSString stringWithUTF8String:row] : nil;
      address.neighborhood = neighborhood;
      [addresses addObject:address];
    }
    // Finaliza o cursor
    sqlite3_finalize(stmt);
  }
  return addresses;
}

@end
