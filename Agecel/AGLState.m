//
//  AGLState.m
//  Agecel
//
//  Created by Andre Furquim on 12/22/12.
//  Copyright (c) 2012 Andre Furquim. All rights reserved.
//

#import "AGLState.h"

@implementation AGLState
@synthesize stateName, stateShortName, image;

- (id)init {
  self = [super init];
  if (self) {
    self.stateName = @"New State";
  }
  return self;
}
@end
