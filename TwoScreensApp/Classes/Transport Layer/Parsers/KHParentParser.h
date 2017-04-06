//
//  KHParentParser.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHMeta.h"


@interface KHParentParser : NSObject


- (KHMeta *)parseMetaWithJSON:(NSDictionary *)aJSON;

@end
