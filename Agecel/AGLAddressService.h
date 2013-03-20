//
//  AGLAddressService.h
//  Agecel
//
//  Created by Andre Furquim on 3/18/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLSQLiteHelper.h"
#import "AGLEstablishment.h"

@interface AGLAddressService : AGLSQLiteHelper

// Pega todos os estados
+(NSMutableArray *)getAddressesFromEstablishment:(AGLEstablishment *)establishment;

// Insere os endereços
+(void) insertAddressesOnDatabase;

@end
