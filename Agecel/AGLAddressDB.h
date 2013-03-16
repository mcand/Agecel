//
//  AGLAddressDB.h
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLSQLiteHelper.h"
#import "AGLAddress.h"
#import "AGLEstablishment.h"

@interface AGLAddressDB : AGLSQLiteHelper

// Retorna o SQL para criar um endereco
-(NSString *)getSQLCreate;

// Salva um novo endereco ou atualiza um já existe pelo id
-(void) saveAddress:(AGLAddress *)address;

// Deleta todos os enderecos
-(void) deleteAddress;

// Retorna todos os enderecos de um estabelecimento
-(NSMutableArray *) getAddressesFromEstablishment:(AGLEstablishment *)establishment;

@end
