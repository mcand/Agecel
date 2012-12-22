//
//  AGLAboutViewController.m
//  Agecel
//
//  Created by Andre Furquim on 12/21/12.
//  Copyright (c) 2012 Andre Furquim. All rights reserved.
//

#import "AGLAboutViewController.h"

@interface AGLAboutViewController ()

@end

@implementation AGLAboutViewController



- (void)viewDidLoad
{
  self.appVersion.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
