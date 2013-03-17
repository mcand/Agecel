//
//  AGLTypeEstablishmentService.m
//  Agecel
//
//  Created by Gilmar Araujo on 3/16/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLTypeEstablishmentService.h"
#import "AGLTypeEstablishment.h"
#import "AGLTypeEstablishmentDB.h"

@implementation AGLTypeEstablishmentService

+(void) insertTypeEstablishmentsOnDatabase{
    AGLTypeEstablishmentDB *db = [[AGLTypeEstablishmentDB alloc]init];
    [db abrir:@"state"];
    
    AGLTypeEstablishment *typeEstablishment = [[AGLTypeEstablishment alloc] init];
    typeEstablishment.typeNameEstablishment = @"Academia";
    [db saveTypeEstablishment:typeEstablishment];
    
    typeEstablishment = [[AGLTypeEstablishment alloc] init];
    typeEstablishment.typeNameEstablishment = @"Supermercado";
    [db saveTypeEstablishment:typeEstablishment];
    
    typeEstablishment = [[AGLTypeEstablishment alloc] init];
    typeEstablishment.typeNameEstablishment = @"Panificadora";
    [db saveTypeEstablishment:typeEstablishment];
    
    typeEstablishment = [[AGLTypeEstablishment alloc] init];
    typeEstablishment.typeNameEstablishment = @"Shopping";
    [db saveTypeEstablishment:typeEstablishment];
    
    [db fechar];
}

@end
