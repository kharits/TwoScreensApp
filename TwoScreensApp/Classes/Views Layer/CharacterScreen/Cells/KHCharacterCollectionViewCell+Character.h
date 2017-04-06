//
//  KHCharacterCollectionViewCell+Character.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacterCollectionViewCell.h"

@class KHCharacter;

@interface KHCharacterCollectionViewCell (Character)

- (void)configureWithCharacter:(KHCharacter *)aCharacter;

@end
