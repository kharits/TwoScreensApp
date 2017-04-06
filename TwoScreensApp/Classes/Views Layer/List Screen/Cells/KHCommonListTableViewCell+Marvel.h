//
//  KHCommonListTableViewCell+Marvel.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCommonListTableViewCell.h"

@class KHCharacter;

@interface KHCommonListTableViewCell (Marvel)

- (void)setupDataWithCharacter:(KHCharacter *)aCharacter;

@end
