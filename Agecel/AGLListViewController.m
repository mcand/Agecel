//
//  AGLListViewController.m
//  Agecel
//
//  Created by Andre Furquim on 12/21/12.
//  Copyright (c) 2012 Andre Furquim. All rights reserved.
//

#import "AGLListViewController.h"
#import "AGLState.h"

@interface AGLListViewController ()

@end

@implementation AGLListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  NSMutableArray *localStates = [NSMutableArray array];
  AGLState *state = [[AGLState alloc] init];
  state.stateName = @"São Paulo";
  state.stateShortName=@"SP";
  state.image = [UIImage imageNamed:@"sao-paulo.jpg"];
  [localStates addObject:state];
  state = [[AGLState alloc] init];
  state.stateName = @"Paraná";
  state.stateShortName=@"PR";
  state.image = [UIImage imageNamed:@"parana.jpg"];

  [localStates addObject:state];
  state = [[AGLState alloc] init];
  state.stateName = @"Santa Catarina";
  state.stateShortName = @"SC";
  state.image = [UIImage imageNamed:@"santa.jpg"];

  [localStates addObject:state];
  
  self.states = localStates;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.states count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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

/*-
 (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
  }
}
 */

@end
