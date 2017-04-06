//
//  KHCharactersTextCollectionViewCell.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharactersTextCollectionViewCell.h"

@implementation KHCharactersTextCollectionViewCell

- (void)dealloc {
    [_titleLabel release];
    [_descriptionTextLabel release];
    [super dealloc];
}
@end
