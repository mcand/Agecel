//
//  AGLCityDB.h
//  Agecel
//
//  Created by Andre Furquim on 2/7/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLSQLiteHelper.h"
#import "AGLCity.h"
#import "AGLState.h"

@interface AGLCityDB : AGLSQLiteHelper
// Retorna o SQL para criar a cidade
-(NSString *)getSQLCreate;

// Salva um novo estado ou atualiza um já existe pelo 
-(void) saveCity:(AGLCity *)city;

// Deleta o carro
-(void) deleteAcity:(AGLCity *)city;

// Deleta todas as cidades
-(void) deleteCities;

// Seleciona todos as cidades de um estado
-(NSMutableArray *)getCitiesFromState:(AGLState *)state;

// Seleciona todos as cidades 
-(NSMutableArray *)getCities;

@end
