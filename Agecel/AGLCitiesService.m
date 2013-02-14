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


@implementation AGLCitiesService {
  NSMutableArray *codStatesWithCities;
  int flag;
}

+(NSMutableArray *)getCities:(AGLState *)codState {
  //NSNumber *number = [NSNumber numberWithInt:codState.id_state];
  AGLCityDB *db = [[AGLCityDB alloc]init];
  [db abrir:@"state"];
  NSMutableArray *cities = [[NSMutableArray alloc] initWithArray:[db getCitiesFromState:codState]];
    
  if ([cities count]==0) {
    [self insertCitiesOnDatabase];
    cities = [db getCitiesFromState:codState];
  }
  
  [db fechar];
  return cities;

}

+(void)insertCitiesOnDatabase {
  AGLCityDB *cityDB = [[AGLCityDB alloc]init];
  [cityDB abrir:@"state"];
  
  AGLCity *city = [[AGLCity alloc]init];

  
  if ([cityDB selectAcity:1] == false) {
  city.idState = 16;
  city.nameCity = @"Curitiba";
  [cityDB saveCity:city];
  }

  if ([cityDB selectAcity:2] == false) {
  city = [[AGLCity alloc]init];
  city.idState = 16;
  city.nameCity = @"Francisco Beltrao";
  [cityDB saveCity:city];
  }
  
  if ([cityDB selectAcity:3] == false) {

  city = [[AGLCity alloc]init];
  city.idState =  16;
  city.nameCity = @"Londrina";
  [cityDB saveCity:city];
  }
  
  if ([cityDB selectAcity:4] == false) {

  city = [[AGLCity alloc]init];
  city.idState = 24;
  city.nameCity = @"Joinville";
  [cityDB saveCity:city];
  }
  
  if ([cityDB selectAcity:5] == false) {

  city = [[AGLCity alloc]init];
  city.idState = 24;
  city.nameCity = @"Florianópolis";
  [cityDB saveCity:city];
  }
  
  if ([cityDB selectAcity:6]== false) {

  city = [[AGLCity alloc]init];
  city.idState = 25;
  city.nameCity = @"São Paulo";
  [cityDB saveCity:city];
  }
  
  [cityDB fechar];
  
  
}

@end
