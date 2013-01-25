//
//  AGLGeralListViewController.h
//  Agecel
//
//  Created by Andre Furquim on 1/11/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGLGeralListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate> {
  IBOutlet UISearchBar *searchBar;
  IBOutlet UITableView *tableView;
}
@property(strong, nonatomic) NSMutableArray *states;
@property(strong, nonatomic) NSMutableArray *localStates;

@end
