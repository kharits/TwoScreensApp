//
//  KHTransport.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHTransport.h"

@implementation KHTransport

- (void)loadPhotoWithURLString:(NSString *)urlString success:(void (^)(NSData *))success failure:(void(^)(NSError *error))failure{
    
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    [sessionConfig setRequestCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failure(error);
        }else{
            success(data);
        }
    }] resume];
    
}

@end
