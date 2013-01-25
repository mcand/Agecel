//
//  EstadoCell.m
//  Agecel
//
//  Created by Andre Furquim on 1/20/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "EstadoCell.h"

@implementation EstadoCell
@synthesize nomeEstado, abreviacaoEstado, bandeira;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
