//
//  AGLGeralListViewController.m
//  Agecel
//
//  Created by Andre Furquim on 1/11/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLGeralListViewController.h"
#import "AGLState.h"

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
  NSMutableArray *localStates = [NSMutableArray array];
  
  AGLState *state = [[AGLState alloc] init];
  state.stateName = @"Acre";
  state.stateShortName=@"AC";
  state.image = [UIImage imageNamed:@"acre.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Alagoas";
  state.stateShortName=@"AL";
  state.image = [UIImage imageNamed:@"alagoas.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Amapa";
  state.stateShortName=@"AM";
  state.image = [UIImage imageNamed:@"amapa.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Amazonas";
  state.stateShortName=@"AM";
  state.image = [UIImage imageNamed:@"amazonas.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Bahia";
  state.stateShortName=@"BA";
  state.image = [UIImage imageNamed:@"bahia.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Ceará";
  state.stateShortName=@"CE";
  state.image = [UIImage imageNamed:@"ceara.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Distrito Federal";
  state.stateShortName=@"DF";
  state.image = [UIImage imageNamed:@"df.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Espírito Santo";
  state.stateShortName=@"ES";
  state.image = [UIImage imageNamed:@"espiritosanto.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Goias";
  state.stateShortName=@"GO";
  state.image = [UIImage imageNamed:@"goias.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"maranhao";
  state.stateShortName=@"MA";
  state.image = [UIImage imageNamed:@"maranhao.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Mato Grosso";
  state.stateShortName=@"MT";
  state.image = [UIImage imageNamed:@"matogrosso.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Mato Grosso do Sul ";
  state.stateShortName=@"MS";
  state.image = [UIImage imageNamed:@"matogrossodosul.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Minas Gerais";
  state.stateShortName=@"MG";
  state.image = [UIImage imageNamed:@"minasgerais.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Pará";
  state.stateShortName=@"PA";
  state.image = [UIImage imageNamed:@"para.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Paraíba";
  state.stateShortName=@"PB";
  state.image = [UIImage imageNamed:@"paraiba.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Paraná";
  state.stateShortName=@"PR";
  state.image = [UIImage imageNamed:@"parana.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Pernambuco";
  state.stateShortName = @"PE";
  state.image = [UIImage imageNamed:@"pernambuco.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Piauí";
  state.stateShortName=@"PI";
  state.image = [UIImage imageNamed:@"piaui.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio do Janeiro";
  state.stateShortName=@"RJ";
  state.image = [UIImage imageNamed:@"riodejaneiro.jpg"];
  [localStates addObject:state];

  state = [[AGLState alloc] init];
  state.stateName = @"Rio Grande do Norte";
  state.stateShortName=@"RN";
  state.image = [UIImage imageNamed:@"riograndedonorte.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rio Grande do Sul";
  state.stateShortName=@"RS";
  state.image = [UIImage imageNamed:@"riograndedosul.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Rondônia";
  state.stateShortName=@"RO";
  state.image = [UIImage imageNamed:@"rondonia.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Roráima";
  state.stateShortName=@"RO";
  state.image = [UIImage imageNamed:@"roraima.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Santa Catarina";
  state.stateShortName=@"SC";
  state.image = [UIImage imageNamed:@"santacatarina.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"São Paulo";
  state.stateShortName=@"SP";
  state.image = [UIImage imageNamed:@"saopaulo.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Sergipe";
  state.stateShortName=@"SE";
  state.image = [UIImage imageNamed:@"sergipe.jpg"];
  [localStates addObject:state];
  
  state = [[AGLState alloc] init];
  state.stateName = @"Tocantins";
  state.stateShortName=@"TO";
  state.image = [UIImage imageNamed:@"tocantins.jpg"];
  [localStates addObject:state];
  
  self.states = localStates;
  // Do any additional setup after loading the view.
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
  return [self.states count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier];
  }
  
  cell.textLabel.text = [[self.states objectAtIndex:indexPath.row] stateName];
  cell.detailTextLabel.text = [[self.states objectAtIndex:indexPath.row] stateShortName];
  cell.imageView.image = [[self.states objectAtIndex:indexPath.row] image];
  
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

#pragma mark - Table view delegate

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

@end
