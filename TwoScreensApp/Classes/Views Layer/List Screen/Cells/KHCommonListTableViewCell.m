//
//  KHCommonListTableViewCell.m
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCommonListTableViewCell.h"

@implementation KHCommonListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_photoImageView release];
    [_nameLabel release];
    [_descriptionLabel release];
    [super dealloc];
}
@end
