//
//  KHCharacter+JSON.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacter+JSON.h"
#import "KHMarvelJSONKeys.h"

@implementation KHCharacter (JSON)

- (void)setupDataWithJSON:(NSDictionary *)aJSON{
    
    self.identity = aJSON[KHMARVEL_KEY_ID];
    self.name = aJSON[KHMARVEL_KEY_NAME];
    self.descriptionText = aJSON[KHMARVEL_KEY_DESCRIPTION];
    NSDictionary *thumbnail = aJSON[KHMARVEL_KEY_THUMBNAIL];
    self.photoStringsURLPath = [NSString stringWithFormat:@"%@.%@",
                                thumbnail[KHMARVEL_KEY_PATH],
                                thumbnail[KHMARVEL_KEY_EXTENSIONS]];
    
}

@end
