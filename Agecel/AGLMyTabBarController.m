//
//  AGLMyTabBarController.m
//  Agecel
//
//  Created by Andre Furquim on 1/25/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLMyTabBarController.h"

@interface AGLMyTabBarController ()

@end

@implementation AGLMyTabBarController

#pragma mark - rotation iOS5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  // Delega para o view controller atual
  return [self.selectedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - rotation iOS6
-(NSUInteger)supportedInterfaceOrientations {
  // Delega para o view controller atual
  return [self.selectedViewController supportedInterfaceOrientations];
}



@end
