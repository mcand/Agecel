   //
//  AGLCityDB.m
//  Agecel
//
//  Created by Andre Furquim on 2/7/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLCityDB.h"
#import "AGLState.h"
#import "AGLCity.h"

@implementation AGLCityDB

// Retorna o SQL para criar a cidade
-(NSString *)getSQLCreate{
  NSString *sql = @"create table if not exists city (id_city integer primary key autoincrement, id_state integer, name_city text, foreign key(id_state) references state(id_state) on delete cascade);";
  return sql;
}

// Salva um novo estado ou atualiza um já existe pelo _id
-(void) saveCity:(AGLCity *)city {
    char *sql = "insert or replace into city (id_city, id_state, name_city) values (?, ?, ?);";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if (resultado == SQLITE_OK) {
      // se for nulo insere, senão atualiza
      if (city.idCity > 0) {
        // informa o id para fazer o update
        sqlite3_bind_int(stmt, 1, city.idCity);
      }
      sqlite3_bind_int(stmt, 2, city.idState);
      sqlite3_bind_text(stmt, 3, [city.nameCity UTF8String], -1, nil);
      
      // executa o sql
      resultado = sqlite3_step(stmt);
      
      if (resultado == SQLITE_DONE){
        NSLog(@"Cidade %@ inserida com sucesso.", city.nameCity);
      }
      sqlite3_finalize(stmt);
    } else {
      NSLog(@"Erro ao inserir a cidade %@!", city.nameCity);
      return;
    }
  
}

// Deleta uma cidade
-(void) deleteAcity:(AGLCity *)city {
  char *sql = "delete from city where id_state=?;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    // infroma o id para deletar
    sqlite3_bind_int(stmt, 1, city.idCity);
    resultado = sqlite3_step(stmt);
    if (resultado == SQLITE_DONE) {
      NSLog(@"Cidade %@ delatada com sucesso!", city.nameCity);
    }
    sqlite3_finalize(stmt);
  }
}

// seleciona a cidade
-(bool) selectAcity:(NSInteger *)city {
  int myInt = city;
  char *sql = "select * from city where id_city=?;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    // informa o id para deletar
    sqlite3_bind_int(stmt, 1, myInt);
    if (sqlite3_step(stmt) == SQLITE_ROW) {
      return true;
    }
    sqlite3_finalize(stmt);
  }
  return false;
}

// Deleta todas as cidades
-(void) deleteCities {
  char *sql = "delete from city;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_DONE) {
    NSLog(@"Todas as cidades de city foram deletadas!");
  }
  sqlite3_finalize(stmt);
}

// Seleciona todos as cidades de um estado
-(NSMutableArray *)getCitiesFromState:(AGLState *)state {
  NSString *query = @"SELECT c.name_city, c.id_city, s.id_state FROM city c JOIN state s ON c.id_state=s.id_state where s.id_state=?;";
  sqlite3_stmt *stmt;
  NSMutableArray *cities = [[NSMutableArray alloc]init];
  int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
  NSLog(@"O id e %d", state.id_state);
  sqlite3_bind_int(stmt, 1, state.id_state);
  if (resultado == SQLITE_OK) {
    while (sqlite3_step(stmt) == SQLITE_ROW) {
      AGLCity *city = [[AGLCity alloc]init];
      char *column = (char *)sqlite3_column_text(stmt, 0);
      city.nameCity = column != nil ? [NSString stringWithUTF8String:column] : nil;
      city.idCity = sqlite3_column_int(stmt, 1);
      city.idState = sqlite3_column_int(stmt, 2);
      [cities addObject:city];
    }
  }
  return cities;
}

// Seleciona todos as cidades
-(NSMutableArray *)getCities{
    // Array que vai armazenar a lista cidades
    NSMutableArray *states = [[NSMutableArray alloc] init];
    // SQL para selecionar as cidades 
    NSString *query = @"select name_city from city order by name_city;";
    sqlite3_stmt *stmt;
    NSMutableArray *cities = [[NSMutableArray alloc]init];
    // cria o stmt
    int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
    if (resultado == SQLITE_OK) {
      while (sqlite3_step(stmt) == SQLITE_ROW) {
        char *row = (char *)sqlite3_column_text(stmt, 0);
        NSString *aCity = [[NSString alloc]init];
        aCity = row != nil ? [NSString stringWithUTF8String:row] : nil;
        [cities addObject:aCity];
      }
      // Finaliza o cursor
      sqlite3_finalize(stmt);
    }
    return states;
}


@end
