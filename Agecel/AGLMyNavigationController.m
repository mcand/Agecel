//
//  AGLMyNavigationController.m
//  Agecel
//
//  Created by Andre Furquim on 1/25/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLMyNavigationController.h"

@interface AGLMyNavigationController ()

@end

@implementation AGLMyNavigationController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - rotation iOS 5
-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  // Delega para o view controller atual (é o último do array)
  return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - roration iOS 6
-(NSUInteger) supportedInterfaceOrientations {
  // Delega para o view controller atual (é o último do array)
  return [self.topViewController supportedInterfaceOrientations];
}


@end
