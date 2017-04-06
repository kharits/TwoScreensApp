//
//  KHCharacterCollectionViewCell.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacterCollectionViewCell.h"

@implementation KHCharacterCollectionViewCell

- (void)dealloc {
    [_photoImageView release];
    [super dealloc];
}
@end
