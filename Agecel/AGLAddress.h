//
//  AGLAddress.h
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLAddress : NSObject {
  NSInteger idAddress;
  NSInteger idEstablishment;
  NSString *street;
  NSString  *zip;
  NSString *complement;
  NSInteger number;
  NSString *neighborhood;
}

 @property (nonatomic, assign) NSInteger idAddress;
 @property (nonatomic, assign) NSInteger idEstablishment;
 @property (nonatomic, strong) NSString *street;
 @property (nonatomic, strong) NSString *zip;
 @property (nonatomic, strong) NSString *complement;
 @property (nonatomic, assign) NSInteger number;
 @property (nonatomic, strong) NSString *neighborhood;
@end
