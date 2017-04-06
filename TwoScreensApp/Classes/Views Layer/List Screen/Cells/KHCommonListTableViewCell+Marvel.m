//
//  KHCommonListTableViewCell+Marvel.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCommonListTableViewCell+Marvel.h"
#import "KHCharacter.h"
#import "KHImageService.h"

@implementation KHCommonListTableViewCell (Marvel)

- (void)setupDataWithCharacter:(KHCharacter *)aCharacter{
    
    [self.nameLabel setText:aCharacter.name];
    [self.descriptionLabel setText:aCharacter.descriptionText];
    
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
