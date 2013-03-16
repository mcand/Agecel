//
//  AGLContact.h
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLContact : NSObject {
  NSInteger idContact;
  NSInteger idEstablishment;
  NSString *phone;
  NSString  *email;
}

@property (nonatomic, assign) NSInteger idContact;
@property (nonatomic, assign) NSInteger idEstablishment;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *email;

@end
