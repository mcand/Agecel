//
//  AGLEstablishmentDB.m
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstablishmentDB.h"
#import "AGLEstablishment.h"

@implementation AGLEstablishmentDB

// Retorna o SQL para criar um estabelecimento
-(NSString *)getSQLCreate {
  NSString *sql = @"create table if not exists establishment (id_establishment  integer primary key autoincrement, id_city integer, id_type_establishment integer, name_establishment text, foreign key(id_city) references city(id_city) on delete cascade, foreign key(id_type_establishment) references type_establishment(id_type_establishment) on delete cascade);";
  return sql;
}

// Salva um novo estabelecimento ou atualiza um já existe pelo
-(void) saveEstablishment:(AGLEstablishment *)establishment {
  char *sql = "insert or replace into establishment (id_establishment, id_city, id_type_establishment, name_establishment ) values (?, ?, ?, ?);";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if(resultado == SQLITE_OK){
    //se for nulo insere, senão atualiza
    if(establishment.idEstablishment > 0){
      //informa o id para fazer o update
      sqlite3_bind_int(stmt, 1, establishment.idEstablishment);
    }
    sqlite3_bind_int(stmt, 2, establishment.idCity);
    sqlite3_bind_int(stmt, 3, establishment.idTypeEstablishment);
    sqlite3_bind_text(stmt, 4, [establishment.nameEstablishment UTF8String], -1, nil);
    //executa o sql
    resultado = sqlite3_step(stmt);
    
    if (resultado == SQLITE_DONE) {
      NSLog(@"Estabelecimento %@ inserido com sucesso.", establishment.nameEstablishment);
    }
    sqlite3_finalize(stmt);
  }else{
    NSLog(@"Erro ao inserir o estabelecimento %@!", establishment.nameEstablishment);
  }

}

// Deleta todos os tipos estabelecimentos
-(void) deleteEstablishments {
  char *sql = "delete from establishment;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_DONE) {
    NSLog(@"Todos os estabelecimentos de establishment foram deletados!");
  }
  sqlite3_finalize(stmt);
}


// Retorna todos os tipos de estabelecimento de uma cidade
-(NSMutableArray *) getTypeEstablishmentsFromCity:(AGLCity *)city withType:(AGLTypeEstablishment *)type{
  // Array que vai armazenar a lista de tipos de estabelecimento
  NSMutableArray *establishments = [[NSMutableArray alloc] init];
  // SQL para selecionar as cidades
  NSString *query = @"select distinct id_establishment, id_city, id_type_establishment, name_establishment from establishment where id_city = ? and id_type_establishment = ? order by id_establishment;";
  sqlite3_stmt *stmt;
  // cria o stmt
  int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    sqlite3_bind_int(stmt, 1, city.idCity);
    sqlite3_bind_int(stmt, 2, type.idTypeEstablishment);
    while (sqlite3_step(stmt) == SQLITE_ROW) {
      AGLEstablishment *establishment = [[AGLEstablishment alloc] init];
      establishment.idEstablishment = sqlite3_column_int(stmt, 0);
      establishment.idCity = sqlite3_column_int(stmt, 1);
      establishment.idTypeEstablishment = sqlite3_column_int(stmt, 2);
      char *row = (char *)sqlite3_column_text(stmt, 3);
      NSString *nameEstablishment = [[NSString alloc]init];
      nameEstablishment = row != nil ? [NSString stringWithUTF8String:row] : nil;
      establishment.nameEstablishment = nameEstablishment;
      [establishments addObject:establishment];
    }
    // Finaliza o cursor
    sqlite3_finalize(stmt);
  }
  return establishments;
}

-(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *) city{
    // Array que vai armazenar a lista de tipos de estabelecimento
    NSMutableArray *typeNameEstablishments = [[NSMutableArray alloc] init];
    // SQL para selecionar as cidades
    NSString *query = @"select distinct t.id_type_establishment, t.type_name_establishment from type_establishment t  join establishment  e on e.id_type_establishment = t.id_type_establishment where id_city = ?;";
    sqlite3_stmt *stmt;
    // cria o stmt
    int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
    if (resultado == SQLITE_OK) {
        sqlite3_bind_int(stmt, 1, city.idCity);
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            AGLTypeEstablishment *typeEstablishment = [[AGLTypeEstablishment alloc] init];
            typeEstablishment.idTypeEstablishment = sqlite3_column_int(stmt, 0);
            char *row = (char *)sqlite3_column_text(stmt, 1);
            NSString *typeNameEstablishment = [[NSString alloc]init];
            typeNameEstablishment = row != nil ? [NSString stringWithUTF8String:row] : nil;
            typeEstablishment.typeNameEstablishment = typeNameEstablishment;
            [typeNameEstablishments addObject:typeEstablishment];
        }
        // Finaliza o cursor
        sqlite3_finalize(stmt);
    }
    return typeNameEstablishments;

}

// seleciona o estabelecimento
-(bool) existEstablishmentWithCod:(NSInteger *)codEstablishment {
    char *sql = "select id_establishment from establishment where id_establishment = ?;";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if (resultado == SQLITE_OK) {
        // informa o id
        sqlite3_bind_int(stmt, 1, codEstablishment);
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            return true;
        }
        sqlite3_finalize(stmt);
    }
    return false;
}

@end
