//
//  KHCharacterViewController.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacterViewController.h"
#import "KHCommonListTableViewCell.h"
#import "KHCharactersTextCollectionViewCell.h"
#import "KHCharactersTextCollectionViewCell+Character.h"
#import "KHCharacterCollectionViewCell.h"
#import "KHCharacterCollectionViewCell+Character.h"
#import "KHCharacter.h"

static CGFloat const kEdgeSpacing = 15.0f;

@interface KHCharacterViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation KHCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged)    name:UIDeviceOrientationDidChangeNotification  object:nil];
}

- (void)orientationChanged{
    
    [self.collectionView reloadData];
    
}

- (void)dealloc {
    [_collectionView release];
    [super dealloc];
}

#pragma mark -
#pragma mark UICollection View Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return kEdgeSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return kEdgeSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
        {
            return CGSizeMake(SCREEN_WIDTH/2-3*kEdgeSpacing,SCREEN_WIDTH/2-3*kEdgeSpacing);
        }
        return CGSizeMake(SCREEN_WIDTH-2*kEdgeSpacing,SCREEN_WIDTH-2*kEdgeSpacing);
    }else{
        return [self sizingForRowAtIndexPath:indexPath];
    }
}

- (CGSize)sizingForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGSize boundingSize;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        boundingSize = CGSizeMake(SCREEN_WIDTH/2-5*kEdgeSpacing, NSIntegerMax);
    }else{
        boundingSize = CGSizeMake(SCREEN_WIDTH-4*kEdgeSpacing, NSIntegerMax);
    }
    
    CGRect labelRect = [self.character.name
                        boundingRectWithSize:boundingSize
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:17]
                                     }
                        context:nil];
    
    CGRect labelRect2 = [self.character.descriptionText
                        boundingRectWithSize:boundingSize
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:15]
                                     }
                        context:nil];
    CGSize cellSize;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        cellSize = CGSizeMake(SCREEN_WIDTH/2-3*kEdgeSpacing,labelRect.size.height + labelRect2.size.height+4*kEdgeSpacing);
    }else{
        cellSize = CGSizeMake(SCREEN_WIDTH-2*kEdgeSpacing,labelRect.size.height + labelRect2.size.height+4*kEdgeSpacing);
    }
    return cellSize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (indexPath.row == 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"characterImageCell" forIndexPath:indexPath];
        [(KHCharacterCollectionViewCell *)cell configureWithCharacter:self.character];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"characterTitleCell" forIndexPath:indexPath];
        [(KHCharactersTextCollectionViewCell *)cell configureWithCharacter:self.character];
    }
    return cell;
}
@end
