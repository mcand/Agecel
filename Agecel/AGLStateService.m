//
//  AGLStateService.m
//  Agecel
//
//  Created by Andre Furquim on 2/3/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLStateService.h"
#import "AGLState.h"
#import "StateDB.h"
@implementation AGLStateService

+(NSMutableArray *)getStates {
  StateDB *db = [[StateDB alloc]init];
  [db abrir:@"state"];
  NSMutableArray *states = [db getStates];
  if ([states count]==0) {
    [self insertStatesOnDatabase];
  }
  [db fechar];  
  return states;
  
}

+(void)insertStatesOnDatabase {

  StateDB *stateDB = [[StateDB alloc]init];
  [stateDB abrir:@"state"];
  
  AGLState *state = [[AGLState alloc] init];
  state.stateName = @"Acre";
  state.stateShortName=@"AC";
  state.imagePath = @"acre.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Alagoas";
  state.stateShortName=@"AL";
  state.imagePath = @"alagoas.png";
  [stateDB saveState:state];
  
  
  state = [[AGLState alloc] init];
  state.stateName = @"Amapa";
  state.stateShortName=@"AM";
  state.imagePath = @"amapa.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Amazonas";
  state.stateShortName=@"AM";
  state.imagePath = @"amazonas.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Bahia";
  state.stateShortName=@"BA";
  state.imagePath = @"bahia.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Ceará";
  state.stateShortName=@"CE";
  state.imagePath = @"ceara.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Distrito Federal";
  state.stateShortName=@"DF";
  state.imagePath = @"df.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Espírito Santo";
  state.stateShortName=@"ES";
  state.imagePath = @"espiritosanto.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Goias";
  state.stateShortName=@"GO";
  state.imagePath = @"goias.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"maranhao";
  state.stateShortName=@"MA";
  state.imagePath = @"maranhao.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Mato Grosso";
  state.stateShortName=@"MT";
  state.imagePath = @"matogrosso.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Mato Grosso do Sul ";
  state.stateShortName=@"MS";
  state.imagePath = @"matogrossodosul.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Minas Gerais";
  state.stateShortName=@"MG";
  state.imagePath = @"minasgerais.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Pará";
  state.stateShortName=@"PA";
  state.imagePath = @"para.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Paraíba";
  state.stateShortName=@"PB";
  state.imagePath = @"paraiba.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Paraná";
  state.stateShortName=@"PR";
  state.imagePath = @"parana.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Pernambuco";
  state.stateShortName = @"PE";
  state.imagePath = @"pernambuco.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Piauí";
  state.stateShortName=@"PI";
  state.imagePath = @"piaui.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio do Janeiro";
  state.stateShortName=@"RJ";
  state.imagePath = @"riodejaneiro.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio Grande do Norte";
  state.stateShortName=@"RN";
  state.imagePath = @"riograndedonorte.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio Grande do Sul";
  state.stateShortName=@"RS";
  state.imagePath = @"riograndedosul.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rondônia";
  state.stateShortName=@"RO";
  state.imagePath = @"rondonia.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Roráima";
  state.stateShortName=@"RO";
  state.imagePath = @"roraima.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Santa Catarina";
  state.stateShortName=@"SC";
  state.imagePath = @"santacatarina.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"São Paulo";
  state.stateShortName=@"SP";
  state.imagePath = @"saopaulo.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Sergipe";
  state.stateShortName=@"SE";
  state.imagePath = @"sergipe.png";
  [stateDB saveState:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Tocantins";
  state.stateShortName=@"TO";
  state.imagePath = @"tocantins.png";
  [stateDB saveState:state];
  [stateDB fechar];
}
@end
