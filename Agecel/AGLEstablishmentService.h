//
//  AGLEstablishmentService.h
//  Agecel
//
//  Created by Gilmar Araujo on 3/16/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLCity.h"

@interface AGLEstablishmentService : NSObject

// Pega todos os tipos de estabelecimentos de uma cidade
+(NSMutableArray *)getEstablishmentsFromCity:(AGLCity *)city;
+(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *) city;

+(void)insertEstablishmentsOnDatabase;


@end
