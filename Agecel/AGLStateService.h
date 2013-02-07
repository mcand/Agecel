//
//  AGLStateService.h
//  Agecel
//
//  Created by Andre Furquim on 2/3/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLStateService : NSObject 

// Pega todos os estados
+(NSMutableArray *)getStates;
+(void)insertStatesOnDatabase;
@end
