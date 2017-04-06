//
//  KHCommonListTableViewCell.h
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHCommonListTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *photoImageView;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
