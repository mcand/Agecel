//
//  AGLEstabelecimentosCidadeViewController.h
//  Agecel
//
//  Created by Andre Furquim on 2/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGLCity.h"

@interface AGLEstabelecimentosCidadeViewController : UITableViewController {
  AGLCity *city;
}
@property(nonatomic, strong) AGLCity *city;
@end
