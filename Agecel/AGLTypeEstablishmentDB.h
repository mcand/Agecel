//
//  AGLTypeEstablishmentDB.h
//  Agecel
//
//  Created by Gilmar Araujo on 2/19/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLSQLiteHelper.h"
#import "AGLState.h"
#import "AGLCity.h"
#import "AGLTypeEstablishment.h"

@interface AGLTypeEstablishmentDB : AGLSQLiteHelper {
    
}
//// Retorna o SQL para criar a cidade
-(NSString *)getSQLCreate;

//// Salva um novo estado ou atualiza um já existe pelo
-(void) saveTypeEstablishment:(AGLTypeEstablishment *)establishmentType;

// Deleta todos os tipos de estabelecimentos de um estado
-(void) deleteTypeEstablishmentsFromState:(AGLState *)state;

// Deleta todos os tipos estabelecimentos 
-(void) deleteTypeEstablishments;

// Deleta todos os tipos de estabelecimentos de uma cidade
-(void) deleteEstablishmentFromCities:(AGLCity *)city;

///// Retorna todos os tipos de estabelecimento de uma cidade
-(NSMutableArray *) getTypeEstablishmentsFromCity:(AGLCity *)city;


@end
