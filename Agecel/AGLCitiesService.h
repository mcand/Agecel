//
//  AGLCitiesService.h
//  Agecel
//
//  Created by Andre Furquim on 2/8/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLState.h"

@interface AGLCitiesService : NSObject {
}
// Pega todos os estados
+(NSMutableArray *)getCities:(AGLState *)codState;
+(void) insertCitiesOnDatabase;
@end
