//
//  AGLListViewController.m
//  Agecel
//
//  Created by Andre Furquim on 12/21/12.
//  Copyright (c) 2012 Andre Furquim. All rights reserved.
//

#import "AGLListViewController.h"
#import "AGLState.h"
#import "Utils.h"

@interface AGLListViewController ()

@end

@implementation AGLListViewController

#pragma mark rotatio iOS6
-(NSUInteger) supportedInterfaceOrientations {
  // Todas menos de ponta cabeça
  return UIInterfaceOrientationMaskPortrait;
}

-(void)viewDidLoad
{

  [super viewDidLoad];

  

  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 44)];
  label.backgroundColor = [UIColor clearColor];
  label.font = [UIFont boldSystemFontOfSize:20.0];
  label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
  label.textColor =[UIColor colorWithRed:0.0/255.0 green:88.0/255 blue:38.0/255 alpha:1.0];
  label.text= @"Estados";
  
  self.navigationItem.titleView = label;
  
  self.navigationController.navigationBar.tintColor = [UIColor
                                                       colorWithRed:254.0/255
                                                       green:198.0/255
                                                       blue:60.0/255
                                                       alpha:1];
  
  self.tabBarController.tabBar.tintColor = [UIColor
                                            colorWithRed:0.0/255
                                            green:116.0/255
                                            blue:57.0/255
                                            alpha:1];
  
  
  UIImage *image = [UIImage imageNamed: @"navimage.png"];
  UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
  
  self.navigationItem.titleView = imageView;
  

  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
