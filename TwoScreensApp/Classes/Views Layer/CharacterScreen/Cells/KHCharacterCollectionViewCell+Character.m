//
//  KHCharacterCollectionViewCell+Character.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCharacterCollectionViewCell+Character.h"
#import "KHImageService.h"
#import "KHCharacter.h"

@implementation KHCharacterCollectionViewCell (Character)

- (void)configureWithCharacter:(KHCharacter *)aCharacter{
    
    UIImage *image = [UIImage imageNamed:@"placeholder"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [[KHImageService sharedInstance] loadPhotoWithLink:aCharacter.photoStringsURLPath success:^(NSData *photoData) {
            dispatch_async(dispatch_get_main_queue(), ^(){
                UIImage *image = [UIImage imageWithData:photoData];
                [self.photoImageView setImage:image];
            });
            
        }failure:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^(){
                [self.photoImageView setImage:image];
            });
        }];
    });
    
}

@end
