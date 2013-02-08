//
//  AGLCitiesService.m
//  Agecel
//
//  Created by Andre Furquim on 2/8/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLCitiesService.h"
#import "AGLCity.h"
#import "AGLState.h"
#import "AGLCityDB.h"

@implementation AGLCitiesService

+(NSMutableArray *)getCities:(AGLState *)codState {
  AGLCityDB *db = [[AGLCityDB alloc]init];
  [db abrir:@"state"];
  NSMutableArray *cities = [db getCitiesFromState:codState];
  if ([cities count]==0) {
    [self insertCitiesOnDatabase];
  }
  [db fechar];
  return cities;
  
}

+(void)insertCitiesOnDatabase {
  
  AGLCityDB *cityDB = [[AGLCityDB alloc]init];
  [cityDB abrir:@"state"];
  
  AGLCity *city = [[AGLCity alloc]init];
  city.idState = 16;
  city.nameCity = @"Curitiba";
  [cityDB saveCity:city];
  
  city = [[AGLCity alloc]init];
  city.idState = 16;
  city.nameCity = @"Francisco Beltrao";
  [cityDB saveCity:city];
  
  city = [[AGLCity alloc]init];
  city.idState =  16;
  city.nameCity = @"Londrina";
  [cityDB saveCity:city];
  
  city = [[AGLCity alloc]init];
  city.idState = 24;
  city.nameCity = @"Joinville";
  [cityDB saveCity:city];
  
  city = [[AGLCity alloc]init];
  city.idState = 24;
  city.nameCity = @"Florianópolis";
  [cityDB saveCity:city];
  
  city = [[AGLCity alloc]init];
  city.idState = 25;
  city.nameCity = @"São Paulo";
  [cityDB saveCity:city];
  
}

@end
