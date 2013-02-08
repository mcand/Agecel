//
//  AGLState.h
//  Agecel
//
//  Created by Andre Furquim on 12/22/12.
//  Copyright (c) 2012 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGLState : NSObject {
  NSString *stateName;
}
  @property (nonatomic, assign) NSInteger id_state;
  @property(nonatomic, copy) NSString *stateName;
  @property(nonatomic, copy) NSString *stateShortName;
  @property(nonatomic, strong) NSString *imagePath;
@end
