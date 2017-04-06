//
//  KHCharacter.m
//  TwoScreensApp
//
//  Created by kharitserg on 31.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacter.h"

@implementation KHCharacter


- (void)dealloc{
    [_name release];
    [_descriptionText release];
    [_photoStringsURLPath release];
    [super dealloc];
}

@end
