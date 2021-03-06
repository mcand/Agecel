//
//  AGLGeralListViewController.m
//  Agecel
//
//  Created by Andre Furquim on 1/11/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLGeralListViewController.h"
#import "AGLState.h"
#import "EstadoCell.h"
#import "AGLEstadoViewController.h"
#import "AGLStateService.h"

@interface AGLGeralListViewController ()

@end

@implementation AGLGeralListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

  [super viewDidLoad];
  
  
  self.states = [AGLStateService getStates];
  
    
  self.localStates = [NSMutableArray arrayWithArray:[AGLStateService getStates]];
  
  
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
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  NSLog(@"Numero de Linhas Chamado!");
  return [self.localStates count];

}


-(void) searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
  [searchBar resignFirstResponder];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"EstadoCell";
  
  EstadoCell *cell = (EstadoCell *) [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  //reuseIdentifier:CellIdentifier];
    cell = [[[NSBundle mainBundle] loadNibNamed:@"EstadoCell" owner:self options:nil] objectAtIndex:0];
  }
  
  cell.nomeEstado.text = [[_localStates objectAtIndex:indexPath.row] stateName];
  cell.abreviacaoEstado.text = [[_localStates objectAtIndex:indexPath.row] stateShortName];
  
  AGLState *imageName = [_localStates objectAtIndex:indexPath.row];
  
  NSLog(@"imagem %@", imageName);
  
  UIImage *image = [UIImage imageNamed:imageName.imagePath];
   
  cell.bandeira.image = image;
  
  return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"Estado"]) {
    AGLEstadoViewController *controller = segue.destinationViewController;
    controller.estado = self.chosenStateForSegue;
  }
}
 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger estado = indexPath.row;
  AGLState *est = [self.localStates objectAtIndex:estado];
  self.chosenStateForSegue = est;

  [self performSegueWithIdentifier:@"Estado" sender:self ];

}

//faz a busca sem ser case sensitive

#pragma mark -


//faz a busca sem ser case sensitive
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
  NSLog(@"%d", [self.states count]);
  if ([searchText length] == 0) {
   [self.localStates removeAllObjects];
   [self.localStates addObjectsFromArray:self.states];
    }else{
      [self.localStates removeAllObjects];
      for (AGLState *state in self.states) {
       NSRange r = [state.stateName rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if(r.location != NSNotFound){
          [self.localStates addObject:state];
        }
      }
  }
  NSLog(@"Depois: %d", [self.localStates count]);
  [self.tableView reloadData];
  
}


@end
