//
//  KHParentParser.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHParentParser.h"
#import "KHMarvelJSONKeys.h"


@implementation KHParentParser

- (KHMeta *)parseMetaWithJSON:(NSDictionary *)aJSON{
    
    NSDictionary *dataDict = aJSON[KHMARVEL_KEY_DATA];
    
    KHMeta *meta = [[KHMeta alloc] init];
    meta.offset = dataDict[KHMARVEL_KEY_OFFSET];
    meta.count = dataDict[KHMARVEL_KEY_COUNT];
    meta.total = dataDict[KHMARVEL_KEY_TOTAL];
    meta.limit =dataDict[KHMARVEL_KEY_LIMIT];
    
    return meta;
}

@end
