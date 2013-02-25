//
//  StateDB.m
//  Agecel
//
//  Created by Andre Furquim on 2/2/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "StateDB.h"
#import "AGLState.h"

@implementation StateDB


// Retorna o SQL para criar um estado
-(NSString *)getSQLCreate {
  NSString *sql = @"pragma foreign_keys=true; create table if not exists state (id_state integer primary key autoincrement, name_state text, image_name text, short_name text);";
  return sql;
}

// Salva um novo estado ou atualiza um já existe pelo _id
-(void) saveState:(AGLState *)state {
  char *sql = "insert or replace into state (id_state, name_state, image_name, short_name) values (?, ?, ?, ?);";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    // se for nulo insere, senão atualiza
    if (state.id_state > 0) {
      // informa o id para fazer o update
      sqlite3_bind_int(stmt, 1, state.id_state);
    }
    sqlite3_bind_text(stmt, 2, [state.stateName UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 3, [state.imagePath UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 4, [state.stateShortName UTF8String], -1, nil);
    
    // executa o sql
    resultado = sqlite3_step(stmt);
    
    if (resultado == SQLITE_DONE){
      NSLog(@"Estado inserido com sucesso");
    }
    sqlite3_finalize(stmt);
  } else {
    NSLog(@"Erro ao inserir o estado");
    return;
  }
}
// Deleta o carro
-(void) deleteAstate:(AGLState *)state {
  char *sql = "delete from state where id_state=?;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    // infroma o id para deletar
    sqlite3_bind_int(stmt, 1, state.id_state);
    resultado = sqlite3_step(stmt);
    if (resultado == SQLITE_DONE) {
      NSLog(@"Deletado com suceso!");
    }
    sqlite3_finalize(stmt);
  }
}
// Deleta todos os estados
-(void) deleteStates {
 char *sql = "delete from state;";
  sqlite3_stmt *stmt;
  int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
  if (resultado == SQLITE_DONE) {
    NSLog(@"Deletado com sucesso!");
  }
  sqlite3_finalize(stmt);
}

// Seleciona todos os estados
-(NSMutableArray *)getStates {
  // Array que vai armazenar a lista de carros
  NSMutableArray *states = [[NSMutableArray alloc] init];
  // SQL para selecionar todos os carros pelo tipo informado
  NSString *query = @"select id_state, name_state, image_name, short_name from state order by id_state;";
  sqlite3_stmt *stmt;
  // cria o stmt
  int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
  if (resultado == SQLITE_OK) {
    while (sqlite3_step(stmt) == SQLITE_ROW) {
      // Cria o carro para inserir na lista
      AGLState *s = [AGLState alloc];
      // Faz a leitura de cada coluna
      s.id_state = sqlite3_column_int(stmt, 0);
      char *column = (char *)sqlite3_column_text(stmt, 1);
      s.stateName = column != nil ? [NSString stringWithUTF8String:column] : nil;
      column = (char *)sqlite3_column_text(stmt, 2);
      s.imagePath = column != nil ? [NSString stringWithUTF8String:column] : nil;
      NSLog(@"Nome do Estado e %@", s.stateName);
      column = (char *)sqlite3_column_text(stmt, 3);
      s.stateShortName = column != nil ? [NSString stringWithUTF8String:column] : nil;
      // Adiciona no array
      [states addObject:s];
    }
    // Finaliza o cursor
    sqlite3_finalize(stmt);
  }
  return states;
}
@end
