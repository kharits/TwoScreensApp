//
//  KHCharacterViewController.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHCharacter;

@interface KHCharacterViewController : UIViewController

@property (nonatomic, retain) KHCharacter *character;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;

@end
