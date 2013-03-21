//
//  AGLEstabelecimentosCidadeViewController.m
//  Agecel
//
//  Created by Andre Furquim on 2/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstabelecimentosCidadeViewController.h"
#import "AGLEstablishmentService.h"
#import "AGLEstablishment.h"
#import "AGLTypeEstablishment.h"
#import "AGLEstabelecimentosViewController.h"

@interface AGLEstabelecimentosCidadeViewController ()

@end

@implementation AGLEstabelecimentosCidadeViewController
@synthesize city, typeNameEstablishmentsFromCity, localTypeEstablishmentsFromCity;

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.title = [NSString stringWithFormat:@"%@", self.city.nameCity];
    
    // Pega todos os tipo de estabelecimentos de uma cidade
    self.typeNameEstablishmentsFromCity = [[NSMutableArray alloc] initWithArray:[AGLEstablishmentService getTypeNameEstablishmentsFromCity:self.city]];
    
    
    NSLog(@"Numero de cidades encontradas no estado e de : %d", [typeNameEstablishmentsFromCity count]);
    
    // Passa para o array auxiliar apenas as cidades do filtro de busca. (OBS: Inicialmente o array terá todas as cidades do estado.
    self.localTypeEstablishmentsFromCity = [NSMutableArray arrayWithArray:typeNameEstablishmentsFromCity];
    
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
    return [self.localTypeEstablishmentsFromCity count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    AGLTypeEstablishment *establishment = [[AGLTypeEstablishment alloc]init];
    establishment = [self.localTypeEstablishmentsFromCity objectAtIndex:indexPath.row];
    cell.textLabel.text = establishment.typeNameEstablishment;
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger typeName = indexPath.row;
    AGLTypeEstablishment *type = [self.localTypeEstablishmentsFromCity objectAtIndex:typeName];
        
    self.chosenTypeEstablishmentForSegue = type;
    
    [self performSegueWithIdentifier:@"NomesEstabelecimento" sender:self ];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NomesEstabelecimento"]) {
        AGLEstabelecimentosViewController *controller = segue.destinationViewController;
        controller.typeEstablishment = self.chosenTypeEstablishmentForSegue;
        controller.city = self.city;
    }
}

#pragma mark - Search
-(void) searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
    [searchBar resignFirstResponder];
}



//faz a busca sem ser case sensitive
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //NSLog(@"%d", [self.states count]);
    if ([searchText length] == 0) {
        [self.localTypeEstablishmentsFromCity removeAllObjects];
        [self.localTypeEstablishmentsFromCity addObjectsFromArray:self.typeNameEstablishmentsFromCity];
    }else{
        [self.localTypeEstablishmentsFromCity removeAllObjects];
        for (AGLTypeEstablishment *typeEstablishment in self.typeNameEstablishmentsFromCity) {
            NSRange r = [typeEstablishment.typeNameEstablishment rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(r.location != NSNotFound){
                [self.localTypeEstablishmentsFromCity addObject:typeEstablishment];
            }
        }
    }
    NSLog(@"Depois: %d", [self.localTypeEstablishmentsFromCity count]);
    [self.tableView reloadData];
    
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
