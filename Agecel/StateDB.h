//
//  StateDB.h
//  Agecel
//
//  Created by Andre Furquim on 2/2/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLSQLiteHelper.h"
#import "AGLState.h"


@interface StateDB : AGLSQLiteHelper {
  
}
// Retorna o SQL para criar o estado
-(NSString *)getSQLCreate;
// Salva um novo estado ou atualiza um já existe pelo _id
-(void) saveState:(AGLState *)state;
// Deleta o carro
-(void) deleteAstate:(AGLState *)state;
// Deleta todos os carros do tipo informado
-(void) deleteStates;
// Seleciona todos os carros do tipo informado
-(NSMutableArray *)getStates;

@end
