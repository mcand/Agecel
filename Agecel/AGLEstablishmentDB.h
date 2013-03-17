//
//  AGLEstablishmentDB.h
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLSQLiteHelper.h"
#import "AGLEstablishment.h"
#import "AGLCity.h"
#import "AGLTypeEstablishment.h"

@interface AGLEstablishmentDB : AGLSQLiteHelper

// Retorna o SQL para criar um estabelecimento
-(NSString *)getSQLCreate;

// Salva um novo estabelecimento ou atualiza um já existe pelo
-(void) saveEstablishment:(AGLEstablishment *)establishment;

// Deleta todos os tipos estabelecimentos
-(void) deleteEstablishments;

// Retorna todos os tipos de nomes de um estabelecimentos de uma cidade e tipos
-(NSMutableArray *) getTypeEstablishmentsFromCity:(AGLCity *)city withType:(AGLTypeEstablishment *)type;
// retorna toodos o tipos de nomes de um estabelecimento a partir de uma cidade
-(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *) city;

//retorna o codigo de um estabelecimento
-(bool) existEstablishmentWithCod:(NSInteger *)codEstablishment;


@end
