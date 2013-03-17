//
//  AGLEstabelecimentosCidadeViewController.h
//  Agecel
//
//  Created by Andre Furquim on 2/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGLCity.h"

@interface AGLEstabelecimentosCidadeViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate> {
  AGLCity *city;
  NSMutableArray *typeNameEstablishmentsFromCity;
  NSMutableArray *localTypeEstablishmentsFromCity;
  IBOutlet UISearchBar *searchBar;
}

@property(nonatomic, strong) AGLCity *city;
@property(nonatomic, strong) NSMutableArray *typeNameEstablishmentsFromCity;
@property(strong, nonatomic) NSMutableArray *localTypeEstablishmentsFromCity;
@property(strong, nonatomic) AGLCity *chosenStateForSegue;
@end


