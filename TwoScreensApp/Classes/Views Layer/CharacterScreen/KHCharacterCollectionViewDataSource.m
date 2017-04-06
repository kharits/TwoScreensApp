//
//  KHCharacterCollectionViewDataSource.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacterCollectionViewDataSource.h"

@interface KHCharacterCollectionViewDataSource ()<UICollectionViewDataSource>

@end

@implementation KHCharacterCollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier;
    switch (indexPath.row) {
        case 0:
            identifier = @"characterImageCell";
            break;
        default:
            identifier = @"characterTitleCell";
            break;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

@end
