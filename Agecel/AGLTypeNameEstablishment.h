//
//  AGLTypeNameEstablishment.h
//  Agecel
//
//  Created by Gilmar Araujo on 2/24/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLTypeNameEstablishment : NSObject{
    NSInteger idTypeNameEstablishment;
    NSString *typeNameEstablishment;
}

@property(nonatomic, assign) NSInteger idTypeNameEstablishment;
@property(nonatomic, strong) NSString *typeNameEstablishment;


@end
