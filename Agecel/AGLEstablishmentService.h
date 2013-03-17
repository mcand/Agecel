//
//  AGLEstablishmentService.h
//  Agecel
//
//  Created by Gilmar Araujo on 3/16/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLTypeEstablishment.h"
#import "AGLCity.h"

@interface AGLEstablishmentService : NSObject

// Pega todos os tipos de estabelecimentos de uma cidade
+(NSMutableArray *)getEstablishmentsFromCity:(AGLCity *)city withType:(AGLTypeEstablishment *)type;
+(void)insertEstablishmentsOnDatabase;
+(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *) city;

@end
