//
//  AGLEstadoViewController.m
//  Agecel
//
//  Created by Andre Furquim on 1/30/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstadoViewController.h"
#import "AGLCitiesService.h"
#import "AGLCity.h"
#import "AGLEstabelecimentosCidadeViewController.h"
@interface AGLEstadoViewController ()

@end

@implementation AGLEstadoViewController
@synthesize citiesFromState;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = [NSString stringWithFormat:@"%@", self.estado.stateName];
  
  // Primeiramente pega todas as cidades de um estado
  self.citiesFromState = [[NSMutableArray alloc] initWithArray:[AGLCitiesService getCities:self.estado]];
  
  
  NSLog(@"Numero de cidades encontradas no estado e de : %d", [citiesFromState count]);
  
  // Passa para o array auxiliar apenas as cidades do filtro de busca. (OBS: Inicialmente o array terá todas as cidades do estado.
  self.localCities = [NSMutableArray arrayWithArray:citiesFromState];
  
  [searchBar setDelegate:self];
  
  searchBar.tintColor = [UIColor
                         colorWithRed:0.0/255
                         green:116.0/255
                         blue:57.0/255
                         alpha:1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.localCities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
    AGLCity *city = [[AGLCity alloc]init];
    city = [self.localCities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.nameCity;
  
    return cell;
}


# pragma mark - Callbacks de Search
-(void) searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
  [searchBar resignFirstResponder];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"Estabelecimento"]) {
    AGLEstabelecimentosCidadeViewController *controller = segue.destinationViewController;
    controller.city = self.chosenStateForSegue;
  }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger cidade = indexPath.row;
  AGLCity *cid = [self.localCities objectAtIndex:cidade];
  self.chosenStateForSegue = cid;
  
  [self performSegueWithIdentifier:@"Estabelecimento" sender:self ];
  
}

//faz a busca sem ser case sensitive
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
  //NSLog(@"%d", [self.states count]);
  if ([searchText length] == 0) {
    [self.localCities removeAllObjects];
    [self.localCities addObjectsFromArray:self.citiesFromState];
  }else{
    [self.localCities removeAllObjects];
    for (AGLCity *city in self.citiesFromState) {
      NSRange r = [city.nameCity rangeOfString:searchText options:NSCaseInsensitiveSearch];
      if(r.location != NSNotFound){
        [self.localCities addObject:city];
      }
    }
  }
  NSLog(@"Depois: %d", [self.localCities count]);
  [self.tableView reloadData];
  
}

@end
