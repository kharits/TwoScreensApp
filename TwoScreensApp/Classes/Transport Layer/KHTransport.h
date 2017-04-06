//
//  KHTransport.h
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHTransport : NSObject

- (void)loadPhotoWithURLString:(NSString *)urlString success:(void (^)(NSData *))success failure:(void(^)(NSError *error))failure;

@end
