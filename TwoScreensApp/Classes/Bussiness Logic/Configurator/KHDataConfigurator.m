//
//  KHDataConfigurator.m
//  TwoScreensApp
//
//  Created by kharitserg on 31.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHDataConfigurator.h"
#import "KHDataService.h"

@implementation KHDataConfigurator

- (void)syncData{
    KHDataService *service = [KHDataService sharedInstance];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [service loadData];
    });
}

@end
