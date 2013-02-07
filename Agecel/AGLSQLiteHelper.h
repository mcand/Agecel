//
//  AGLSQLiteHelper.h
//  Agecel
//
//  Created by Andre Furquim on 2/2/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface AGLSQLiteHelper : NSObject {
  sqlite3 *bancoDeDados;
}

// Abre o banco de dados
-(void) abrir:(NSString *)nomeBanco;

// Fecha o banco de dados
-(void) fechar;

// Retorna o SQL para criar a tabela (deve ser implementado pela sub-classe)
-(NSString *)getSQLCreate;

@end
