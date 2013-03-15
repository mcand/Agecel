//
//  AGLEstablishment.h
//  Agecel
//
//  Created by Gilmar Araujo on 3/14/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLEstablishment : NSObject{
    NSInteger idEstablishment;
    NSInteger idCity;
    NSInteger idTypeEstablishment;
    NSString *nameEstablishment;
}

@property (nonatomic, assign) NSInteger idEstablishment;
@property (nonatomic, assign) NSInteger idCity;
@property (nonatomic, assign) NSInteger idTypeEstablishment;
@property (nonatomic, strong) NSString *nameEstablishment;

@end
