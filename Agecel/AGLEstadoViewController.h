//
//  AGLEstadoViewController.h
//  Agecel
//
//  Created by Andre Furquim on 1/30/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGLState.h"
#import "AGLCity.h"

@interface AGLEstadoViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate> {
  NSMutableArray *citiesFromState;
  IBOutlet UISearchBar *searchBar;
}
@property(nonatomic, strong) AGLState *estado;
@property(nonatomic, strong) NSMutableArray *citiesFromState;
@property(strong, nonatomic) NSMutableArray *localCities;
@property(strong, nonatomic) AGLCity *chosenStateForSegue;
@end
