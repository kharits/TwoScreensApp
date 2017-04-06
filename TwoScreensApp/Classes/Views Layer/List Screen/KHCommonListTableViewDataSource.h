//
//  KHCommonListTableViewDataSource.h
//  TwoScreensApp
//
//  Created by kharitserg on 31.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KHCommonListTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, retain) NSArray *items;

@end
