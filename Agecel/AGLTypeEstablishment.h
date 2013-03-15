//
//  AGLTypeEstablishment.h
//  Agecel
//
//  Created by Gilmar Araujo on 2/24/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLTypeEstablishment : NSObject{
    NSInteger idTypeEstablishment;
    NSString *typeNameEstablishment;
}

@property(nonatomic, assign) NSInteger idTypeEstablishment;
@property(nonatomic, strong) NSString *typeNameEstablishment;

@end
