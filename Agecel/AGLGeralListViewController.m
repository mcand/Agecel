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
  
  
  self.states = [NSMutableArray array];
  
  AGLState *state = [[AGLState alloc] init];
  state.stateName = @"Acre";
  state.stateShortName=@"AC";
  state.image = [UIImage imageNamed:@"acre.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Alagoas";
  state.stateShortName=@"AL";
  state.image = [UIImage imageNamed:@"alagoas.png"];
  [self.states addObject:state];

  
  state = [[AGLState alloc] init];
  state.stateName = @"Amapa";
  state.stateShortName=@"AM";
  state.image = [UIImage imageNamed:@"amapa.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Amazonas";
  state.stateShortName=@"AM";
  state.image = [UIImage imageNamed:@"amazonas.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Bahia";
  state.stateShortName=@"BA";
  state.image = [UIImage imageNamed:@"bahia.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Ceará";
  state.stateShortName=@"CE";
  state.image = [UIImage imageNamed:@"ceara.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Distrito Federal";
  state.stateShortName=@"DF";
  state.image = [UIImage imageNamed:@"df.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Espírito Santo";
  state.stateShortName=@"ES";
  state.image = [UIImage imageNamed:@"espiritosanto.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Goias";
  state.stateShortName=@"GO";
  state.image = [UIImage imageNamed:@"goias.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"maranhao";
  state.stateShortName=@"MA";
  state.image = [UIImage imageNamed:@"maranhao.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Mato Grosso";
  state.stateShortName=@"MT";
  state.image = [UIImage imageNamed:@"matogrosso.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Mato Grosso do Sul ";
  state.stateShortName=@"MS";
  state.image = [UIImage imageNamed:@"matogrossodosul.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Minas Gerais";
  state.stateShortName=@"MG";
  state.image = [UIImage imageNamed:@"minasgerais.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Pará";
  state.stateShortName=@"PA";
  state.image = [UIImage imageNamed:@"para.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Paraíba";
  state.stateShortName=@"PB";
  state.image = [UIImage imageNamed:@"paraiba.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Paraná";
  state.stateShortName=@"PR";
  state.image = [UIImage imageNamed:@"parana.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Pernambuco";
  state.stateShortName = @"PE";
  state.image = [UIImage imageNamed:@"pernambuco.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Piauí";
  state.stateShortName=@"PI";
  state.image = [UIImage imageNamed:@"piaui.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio do Janeiro";
  state.stateShortName=@"RJ";
  state.image = [UIImage imageNamed:@"riodejaneiro.png"];
  [self.states addObject:state];

  state = [[AGLState alloc] init];
  state.stateName = @"Rio Grande do Norte";
  state.stateShortName=@"RN";
  state.image = [UIImage imageNamed:@"riograndedonorte.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio Grande do Sul";
  state.stateShortName=@"RS";
  state.image = [UIImage imageNamed:@"riograndedosul.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rondônia";
  state.stateShortName=@"RO";
  state.image = [UIImage imageNamed:@"rondonia.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Roráima";
  state.stateShortName=@"RO";
  state.image = [UIImage imageNamed:@"roraima.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Santa Catarina";
  state.stateShortName=@"SC";
  state.image = [UIImage imageNamed:@"santacatarina.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"São Paulo";
  state.stateShortName=@"SP";
  state.image = [UIImage imageNamed:@"saopaulo.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Sergipe";
  state.stateShortName=@"SE";
  state.image = [UIImage imageNamed:@"sergipe.png"];
  [self.states addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Tocantins";
  state.stateShortName=@"TO";
  state.image = [UIImage imageNamed:@"tocantins.png"];
  [self.states addObject:state];
  
  self.localStates = [NSMutableArray arrayWithArray:self.states];
  
  // Do any additional setup after loading the view.
  
  [searchBar setDelegate:self];
  
  searchBar.tintColor = [UIColor
                         colorWithRed:233.0/255
                         green:127.0/255
                         blue:28.0/255
                         alpha:1];
  
  //[self.tableView setDelegate:self];
  

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
  cell.bandeira.image = [[_localStates objectAtIndex:indexPath.row] image];
  
  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

//faz a busca sem ser case sensitive

#pragma mark -

/*
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
  NSLog(@"Foi chamado!");
  
  [self.localStates removeAllObjects];
  
  for(int i = 0; i < [self.states count]; i++) {
    AGLState *s = [self.states objectAtIndex:i];

    if ([s.stateName isEqualToString:searchText]) {
      [self.localStates addObject:searchText];
      NSLog(@"teste");
    }
    
  }
  NSLog(@"teste2 %@", self.localStates );
[self.tableView reloadData];
  
}
*/


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
//-(void) sea

/*

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
  NSPredicate *resultPredicate = [NSPredicate
                                  predicateWithFormat:@"SELF contains[cd] %@",
                                  searchText];
  
  self.localStates = [self.states filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDispayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
  [self filterContentForSearchText:searchString
                             scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                    objectAtIndex:[self.searchDisplayController.searchBar
                                                   selectedScopeButtonIndex]]];
  
  return YES;
}
*/

@end
