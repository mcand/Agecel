//
//  AGLAddressService.m
//  Agecel
//
//  Created by Andre Furquim on 3/18/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLAddressService.h"
#import "AGLAddress.h"
#import "AGLAddressDB.h"

@implementation AGLAddressService

// Pega todos os estados
+(NSMutableArray *)getAddressesFromEstablishment:(AGLEstablishment *)establishment{
  NSMutableArray *addressesFromEstablishment = [[NSMutableArray alloc] init];
  AGLAddressDB *db = [[AGLAddressDB alloc]init];
  [db abrir:@"state"];
  if ([addressesFromEstablishment count]==0) {
    [self insertAddressesOnDatabase];
  }
  addressesFromEstablishment = [db getAddressesFromEstablishment:establishment];
  [db fechar];
  return addressesFromEstablishment;
  
}

// Insere os endereços
+(void) insertAddressesOnDatabase{
  AGLAddressDB *addressDB = [[AGLAddressDB alloc]init];
  [addressDB abrir:@"state"];
  
  AGLAddress *address = [[AGLAddress alloc]init];
  
  if (![addressDB existAddressWithCod:1]) {
    address.idEstablishment = 1;
    address.street = @"Av Santos Dumont";
    address.zip = @"89219710";
    address.complement = @"Em frente ao posto Esso";
    address.number = 445;
    address.neighborhood = @"Bom Retiro";
    
    [addressDB saveAddress:address];
  }
  
  if (![addressDB existAddressWithCod:2]) {
    address.idEstablishment = 2;
    address.street = @"Av Rubert Schmidt";
    address.zip = @"89219540";
    address.complement = @"Em frente a Motorplace";
    address.number = 123;
    address.neighborhood = @"Center";
    
    [addressDB saveAddress:address];
  }
  
  if (![addressDB existAddressWithCod:3]) {
    address.idEstablishment = 3;
    address.street = @"Av Santos Dumont";
    address.zip = @"89219770";
    address.complement = @"Antes do semáforo";
    address.number = 1235;
    address.neighborhood = @"Bom Retiro";
    
    [addressDB saveAddress:address];
  }
  
  if (![addressDB existAddressWithCod:4]) {
    address.idEstablishment = 4;
    address.street = @"Av Joao Colin";
    address.zip = @"89214677";
    address.complement = @"Pero do cruzamento";
    address.number = 445;
    address.neighborhood = @"Bom Retiro";
    
    [addressDB saveAddress:address];
  }
  
  if (![addressDB existAddressWithCod:5]) {
    address.idEstablishment = 1;
    address.street = @"Av Brasil";
    address.zip = @"892193546";
    address.complement = @"Anexo ao complexo 5";
    address.number = 123;
    address.neighborhood = @"América";
    
    [addressDB saveAddress:address];
  }
  
  [addressDB fechar];
}


@end
