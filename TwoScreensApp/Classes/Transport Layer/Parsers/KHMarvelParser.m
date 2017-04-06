//
//  KHMarvelParser.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHMarvelParser.h"
#import "KHCharacter.h"
#import "KHCharacter+JSON.h"
#import "KHMarvelJSONKeys.h"

@implementation KHMarvelParser

- (NSArray *)parseCharactersWithJSON:(NSDictionary *)aJSON{
    
    NSMutableArray *characters = [NSMutableArray array];
    
    NSDictionary *dataDict = aJSON[KHMARVEL_KEY_DATA];
    NSArray *items = dataDict[KHMARVEL_KEY_RESULTS];
    
    for (NSDictionary *dict in items) {
        KHCharacter *character = [[KHCharacter alloc] init];
        [character setupDataWithJSON:dict];
        [characters addObject:character];
    }
    
    return characters;
}

@end
