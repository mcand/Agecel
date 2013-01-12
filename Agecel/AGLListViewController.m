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

-(void)viewDidLoad
{
  /*
  UIFont *buttonFont = [UIFont fontWithName:@"Noteworthy-Bold" size:17.0];
  UIColor *buttonColorDefault = [UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1.0];
  UIColor *buttonColorHighlight = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
  UIImage *btn = [UIImage imageNamed:@"Button.png"];
  UIImage *btnh = [UIImage imageNamed:@"ButtonHighlighted.png"];
  
  // building the buttons
  UIButton *aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [aboutBtn addTarget:self action:@selector(showAboutPage) forControlEvents:UIControlEventTouchUpInside];
  [aboutBtn setTitle:@"Busca Geral" forState:UIControlStateNormal];
  [aboutBtn setFrame:CGRectMake(15.0, 60.0, 145.0, 90.0)];
  [aboutBtn setBackgroundImage:btn forState:UIControlStateNormal];
  [aboutBtn setBackgroundImage:btnh forState:UIControlStateHighlighted];
  [aboutBtn.titleLabel setFont:buttonFont];
  [aboutBtn setTitleColor:buttonColorDefault forState:UIControlStateNormal];
  [aboutBtn setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
  
  UIButton *busca1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [busca1 addTarget:self action:@selector(showAboutPage) forControlEvents:UIControlEventTouchUpInside];
  [busca1 setTitle:@"Busca Lozalização" forState:UIControlStateNormal];
  [busca1 setFrame:CGRectMake(165.0, 60.0, 145.0, 90.0)];
  [busca1 setBackgroundImage:btn forState:UIControlStateNormal];
  [busca1 setBackgroundImage:btnh forState:UIControlStateHighlighted];
  [busca1.titleLabel setFont:buttonFont];
  [busca1 setTitleColor:buttonColorDefault forState:UIControlStateNormal];
  [busca1 setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
  
  UIButton *busca2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [busca2 addTarget:self action:@selector(showAboutPage) forControlEvents:UIControlEventTouchUpInside];
  [busca2 setTitle:@"Busca Lozalização" forState:UIControlStateNormal];
  [busca2 setFrame:CGRectMake(15.0, 180.0, 145.0, 90.0)];
  [busca2 setBackgroundImage:btn forState:UIControlStateNormal];
  [busca2 setBackgroundImage:btnh forState:UIControlStateHighlighted];
  [busca2.titleLabel setFont:buttonFont];
  [busca2 setTitleColor:buttonColorDefault forState:UIControlStateNormal];
  [busca2 setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
  
  [self.view addSubview:aboutBtn];
  [self.view addSubview:busca1];
  [self.view addSubview:busca2];
   */




}

/*- (void)viewDidLoad
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
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
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
 */

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
