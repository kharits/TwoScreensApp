//
//  KHDataService.h
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHCharacter;

@interface KHDataService : NSObject

@property (nonatomic, retain) NSArray *characters;

+ (instancetype)sharedInstance;
- (void)loadData;

@end
