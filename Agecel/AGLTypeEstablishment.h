//
//  AGLTypeEstablishment.h
//  Agecel
//
//  Created by Gilmar Araujo on 2/24/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLTypeEstablishment : NSObject{
    NSInteger id_type_establishment;
    NSInteger id_city;
    NSInteger id_type_name_establishment;
}

@property(nonatomic, assign) NSInteger id_type_establishment;
@property(nonatomic, assign) NSInteger id_city;
@property(nonatomic, assign) NSInteger id_type_name_establishment;

@end
