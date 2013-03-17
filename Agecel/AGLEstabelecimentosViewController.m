//
//  AGLEstabelecimentosViewController.m
//  Agecel
//
//  Created by Gilmar Araujo on 3/17/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstabelecimentosViewController.h"
#import "AGLEstablishmentService.h"
#import "AGLEstablishment.h"
#import "AGLEstablishmentDetailsViewController.h"

@interface AGLEstabelecimentosViewController ()

@end

@implementation AGLEstabelecimentosViewController
@synthesize typeEstablishment, establishmentsFromCity, localEstablishmentsFromCity, chosenEstablishmentForSegue,city;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = [NSString stringWithFormat:@"%@", typeEstablishment.typeNameEstablishment];
    
    // Pega todos os tipo de estabelecimentos de uma cidade
    self.establishmentsFromCity = [[NSMutableArray alloc] initWithArray:[AGLEstablishmentService getEstablishmentsFromCity:city withType:typeEstablishment]];
    
    
    NSLog(@"Numero de estabelecimentos encontrados no estado e de : %d", [establishmentsFromCity count]);
    
    // Passa para o array auxiliar apenas as cidades do filtro de busca. (OBS: Inicialmente o array terá todas as cidades do estado.
    self.localEstablishmentsFromCity = [NSMutableArray arrayWithArray:establishmentsFromCity];
    
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
    return [localEstablishmentsFromCity count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    AGLEstablishment *establishment = [[AGLEstablishment alloc]init];
    establishment = [self.localEstablishmentsFromCity objectAtIndex:indexPath.row];
    cell.textLabel.text = establishment.nameEstablishment;
    
    return cell;
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
    [searchBar resignFirstResponder];
}



//faz a busca sem ser case sensitive
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //NSLog(@"%d", [self.states count]);
    if ([searchText length] == 0) {
        [self.localEstablishmentsFromCity removeAllObjects];
        [self.localEstablishmentsFromCity addObjectsFromArray:self.establishmentsFromCity];
    }else{
        [self.localEstablishmentsFromCity removeAllObjects];
        for (AGLEstablishment *establishment in self.establishmentsFromCity) {
            NSRange r = [establishment.nameEstablishment rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(r.location != NSNotFound){
                [self.localEstablishmentsFromCity addObject:establishment];
            }
        } 
    }
    NSLog(@"Depois: %d", [self.localEstablishmentsFromCity count]);
    [self.tableView reloadData];
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger typeName = indexPath.row;
    AGLEstablishment *establishment = [self.localEstablishmentsFromCity objectAtIndex:typeName];
    
    self.chosenEstablishmentForSegue = establishment;
    
    [self performSegueWithIdentifier:@"Endereco" sender:self ];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Endereco"]) {
        AGLEstablishmentDetailsViewController *controller = segue.destinationViewController;
        controller.establishment = self.chosenEstablishmentForSegue;
    }
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



@end
