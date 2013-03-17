//
//  AGLEstabelecimentosViewController.h
//  Agecel
//
//  Created by Gilmar Araujo on 3/17/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGLTypeEstablishment.h"
#import "AGLEstablishment.h"
#import "AGLCity.h"

@interface AGLEstabelecimentosViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate> {
    AGLTypeEstablishment *typeEstablishment;
    AGLCity *city;
    NSMutableArray *establishmentsFromCity;
    NSMutableArray *localEstablishmentsFromCity; // variável usada na busca 
    IBOutlet UISearchBar *searchBar;
}

@property(nonatomic, strong) AGLTypeEstablishment *typeEstablishment;
@property(nonatomic, strong) NSMutableArray *establishmentsFromCity;
@property(strong, nonatomic) NSMutableArray *localEstablishmentsFromCity;
@property(strong, nonatomic) AGLEstablishment *chosenEstablishmentForSegue;
@property(nonatomic, strong) AGLCity *city;

@end
