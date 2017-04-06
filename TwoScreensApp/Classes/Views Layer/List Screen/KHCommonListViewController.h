//
//  KHCommonListViewController.h
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHParentViewController.h"

@class KHCommonListTableViewDataSource;

@interface KHCommonListViewController : KHParentViewController

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet KHCommonListTableViewDataSource *dataSource;


@end
