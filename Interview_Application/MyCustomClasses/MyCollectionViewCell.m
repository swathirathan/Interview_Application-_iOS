//
//  MyCollectionViewCell.m
//  Interview_Application
//
//  Created by prem on 20/07/15.
//  Copyright (c) 2015 Swathi Rathan. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    /*if (highlighted) {
     self.alpha = 0.5;
     }
     else {
     self.alpha = 1.f;
     }*/
}

@end
