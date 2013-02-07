//
//  AGLSQLiteHelper.m
//  Agecel
//
//  Created by Andre Furquim on 2/2/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLSQLiteHelper.h"

@implementation AGLSQLiteHelper

-(NSString *)caminhoDoArquivo:(NSString *)nomeBanco {
  NSString *db = [NSString stringWithFormat:@"%@.sqlite3", nomeBanco];
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *caminhoArquivo = [documentsDirectory stringByAppendingPathComponent:db];
  NSLog(@"%@", caminhoArquivo);
  return caminhoArquivo;
}

// Abre o banco de dados no ponteiro "sqlite3" *bancoDeDados
-(void) abrir:(NSString *)nomeBanco {
  int result = sqlite3_open([[self caminhoDoArquivo:nomeBanco] UTF8String] , &bancoDeDados);
  if (result == SQLITE_OK) {
    // Se o banco foi aberto com sucesso
    // Solicita a sub-classe para retornar o SQL para a criação da tabela
    // Não e para criar toda hora: verificar novamene;
    NSString *sql = [self getSQLCreate];
    char *errorMsg;
    // Executa o SQL para criar a tabela, se necessário
    int resultado = sqlite3_exec(bancoDeDados, [sql UTF8String], NULL, NULL, &errorMsg);
    if (resultado == SQLITE_OK) {
      // tabela criada com sucesso
      NSLog(@"Tabela criada com sucesso!");
    } else {
      NSString *error = [NSString stringWithCString:errorMsg encoding:NSUTF8StringEncoding];
      NSLog(@"Erro ao criar a tabela %d - %@", result, error);
    }
  } else {
    NSLog(@"Erro ao criar ao abrir o banco de dados");
  }
}

// Fecha o banco de dados
-(void) fechar {
  sqlite3_close(bancoDeDados);
}

// Método que retorna o SQL utilizado para  criar a tabela
-(NSString *)getSQLCreate {
  // Sub-classes precisam implementar
  return nil;
}
@end
