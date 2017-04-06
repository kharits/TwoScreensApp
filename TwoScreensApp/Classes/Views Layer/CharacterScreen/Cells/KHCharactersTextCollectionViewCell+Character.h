//
//  KHCharactersTextCollectionViewCell+Character.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharactersTextCollectionViewCell.h"

@class KHCharacter;

@interface KHCharactersTextCollectionViewCell (Character)

- (void)configureWithCharacter:(KHCharacter *)aCharacter;

@end
