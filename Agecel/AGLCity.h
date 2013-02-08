//
//  AGLCity.h
//  Agecel
//
//  Created by Andre Furquim on 2/8/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLCity : NSObject {
  NSInteger idCity;
  NSInteger idState;
  NSString *nameCity;
}

@property(nonatomic, assign) NSInteger idCity;
@property(nonatomic, assign) NSInteger idState;
@property(nonatomic, strong) NSString *nameCity;

@end
