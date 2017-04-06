//
//  AppDelegate.m
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "AppDelegate.h"
#import "KHDataConfigurator.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    KHDataConfigurator *configurator = [[KHDataConfigurator alloc] init];
    [configurator syncData];
    return YES;
}



@end
