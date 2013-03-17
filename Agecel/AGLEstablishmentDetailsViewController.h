//
//  AGLEstablishmentDetailsViewController.h
//  Agecel
//
//  Created by Gilmar Araujo on 3/17/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGLEstablishment.h"            

@interface AGLEstablishmentDetailsViewController : UIViewController{
    AGLEstablishment *establishment;
}

@property (nonatomic, strong) AGLEstablishment *establishment;

@end
