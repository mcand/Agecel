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
  NSMutableArray *addressesFromEstrablishment;
  IBOutlet UITextView *street;
  IBOutlet UILabel *number;
  IBOutlet UILabel *complement;
  IBOutlet UILabel *zip;
  IBOutlet UILabel *neighborhood;
}

@property (nonatomic, strong) AGLEstablishment *establishment;
@property (nonatomic, strong) NSMutableArray *addressesFromEstrablishment;


@end
