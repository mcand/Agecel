//
//  AGLTypeNameEstablishmentDB.h
//  Agecel
//
//  Created by Gilmar Araujo on 2/24/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLTypeNameEstablishment.h"
#import "AGLCity.h"
#import "AGLSQLiteHelper.h"

@interface AGLTypeNameEstablishmentDB : AGLSQLiteHelper{
    
}
-(NSString *)getSQLCreate;

// Salva um novo estado ou atualiza um já existe pelo
-(void) saveTypeNameEstablishment:(AGLTypeNameEstablishment *)establishmentTypeName;

// Deleta todos os tipos estabelecimentos
-(void) deleteTypeEstablishments;

// Retorna todos os tipos de estabelecimento de uma cidade
-(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *)city;

@end
