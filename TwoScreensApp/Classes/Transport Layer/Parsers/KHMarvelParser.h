//
//  KHMarvelParser.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHParentParser.h"


@interface KHMarvelParser : KHParentParser

- (NSArray *)parseCharactersWithJSON:(NSDictionary *)aJSON;


@end
