//
//  AGLEstablishmentService.m
//  Agecel
//
//  Created by Gilmar Araujo on 3/16/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstablishmentService.h"
#import "AGLEstablishmentDB.h"
#import "AGLEstablishment.h"
#import "AGLTypeEstablishmentService.h"
#import "AGLTypeEstablishmentDB.h"

@implementation AGLEstablishmentService

+(NSMutableArray *)getEstablishmentsFromCity:(AGLCity *)city withType:(AGLTypeEstablishment *)type{
    NSMutableArray *typeNamesEstablishments = [[NSMutableArray alloc] init];
    AGLEstablishmentDB *db = [[AGLEstablishmentDB alloc]init];
    [db abrir:@"state"];
    if ([typeNamesEstablishments count]==0) {
        [self insertEstablishmentsOnDatabase];
        typeNamesEstablishments = [db getTypeEstablishmentsFromCity:city withType:type];
    }
    
    typeNamesEstablishments = [db getTypeEstablishmentsFromCity:city withType:type];
    [db fechar];
    return typeNamesEstablishments;
}

+(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *) city{
    NSMutableArray *typeNamesEstablishments = [[NSMutableArray alloc] init];
    AGLEstablishmentDB *db = [[AGLEstablishmentDB alloc]init];
    [db abrir:@"state"];
    [self insertEstablishmentsOnDatabase];
    typeNamesEstablishments = [db getTypeNameEstablishmentsFromCity:city];
    [db fechar];
    return typeNamesEstablishments;
}


+(void)insertEstablishmentsOnDatabase {
    AGLEstablishmentDB *establishmentDB = [[AGLEstablishmentDB alloc]init];
    [establishmentDB abrir:@"state"];
    
    AGLEstablishment *establishment = [[AGLEstablishment  alloc]init];
    
     if (![establishmentDB existEstablishmentWithCod:1]) {
         [AGLTypeEstablishmentService insertTypeEstablishmentsOnDatabase];
         establishment.idCity = 4;
         establishment.idTypeEstablishment = 1;
         establishment.nameEstablishment = @"Civi";
         [establishmentDB saveEstablishment:establishment];
     }
    
    if (![establishmentDB existEstablishmentWithCod:2]) {
         establishment = [[AGLEstablishment  alloc]init];
         establishment.idCity = 4;
         establishment.idTypeEstablishment = 1;
         establishment.nameEstablishment = @"The Best";
         [establishmentDB saveEstablishment:establishment];
    }
    
    if (![establishmentDB existEstablishmentWithCod:3]) {
         establishment = [[AGLEstablishment  alloc]init];
         establishment.idCity = 4;
         establishment.idTypeEstablishment = 2;
         establishment.nameEstablishment = @"Albino";
    [establishmentDB saveEstablishment:establishment];
    }
    
    if (![establishmentDB existEstablishmentWithCod:4]) {
         establishment = [[AGLEstablishment  alloc]init];
         establishment.idCity = 4;
         establishment.idTypeEstablishment = 2;
         establishment.nameEstablishment = @"Angeloni";
         [establishmentDB saveEstablishment:establishment];
    }
    
           
    [establishmentDB fechar];
}



@end
