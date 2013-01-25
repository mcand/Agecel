//
//  EstadoCell.h
//  Agecel
//
//  Created by Andre Furquim on 1/20/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EstadoCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UILabel *nomeEstado;
@property(nonatomic, strong) IBOutlet UILabel *abreviacaoEstado;
@property(nonatomic, strong) IBOutlet UIImageView *bandeira;
@end
