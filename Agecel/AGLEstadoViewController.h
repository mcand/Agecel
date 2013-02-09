//
//  AGLEstadoViewController.h
//  Agecel
//
//  Created by Andre Furquim on 1/30/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGLState.h"

@interface AGLEstadoViewController : UITableViewController {
  NSMutableArray *citiesFromState;
}
@property(nonatomic, strong) AGLState *estado;
@property(nonatomic, strong) NSMutableArray *citiesFromState;



@end
