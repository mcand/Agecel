//
//  Utils.m
//  Agecel
//
//  Created by Andre Furquim on 1/18/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "Utils.h"

@interface Utils ()

@end

@implementation Utils


+ (BOOL) isIphone {
  BOOL iPhone = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
  return iPhone;
}
+ (BOOL) isIpad {
  BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
  return iPad;
}

+ (BOOL) isPortrait {
  UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
  BOOL landscape = orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight;
  return landscape;
}
+ (BOOL) isLandscape {
  UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
  BOOL portrait = orientation == UIDeviceOrientationPortrait;
  return portrait;
}

@end
