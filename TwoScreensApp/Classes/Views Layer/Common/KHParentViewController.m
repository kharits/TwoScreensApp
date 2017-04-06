//
//  KHParentViewController.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHParentViewController.h"

@interface KHParentViewController ()

@end

@implementation KHParentViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initServices];
    }
    return self;
}

- (void)initServices{
    self.dataService = [KHDataService sharedInstance];
}

- (void)dealloc{
    [super dealloc];
}

@end
