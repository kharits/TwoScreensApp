//
//  KHCharactersTextCollectionViewCell+Character.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharactersTextCollectionViewCell+Character.h"
#import "KHCharacter.h"

@implementation KHCharactersTextCollectionViewCell (Character)

- (void)configureWithCharacter:(KHCharacter *)aCharacter{
    [self.titleLabel setText:aCharacter.name];
    [self.descriptionTextLabel setText:aCharacter.descriptionText];
}

@end
