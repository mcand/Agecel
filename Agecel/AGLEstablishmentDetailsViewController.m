//
//  AGLEstablishmentDetailsViewController.m
//  Agecel
//
//  Created by Gilmar Araujo on 3/17/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstablishmentDetailsViewController.h"

@interface AGLEstablishmentDetailsViewController ()

@end

@implementation AGLEstablishmentDetailsViewController
@synthesize establishment;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@", establishment.nameEstablishment];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
