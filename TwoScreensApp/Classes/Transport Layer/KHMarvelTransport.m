//
//  KHMarvelTransport.m
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHMarvelTransport.h"
#import "NSString+MD5.h"

static NSString * const kBaseURLString = @"https://gateway.marvel.com:443/v1/public/";
static NSString * const kMarvelCharactersPath = @"characters";

static NSString * const kPrivateKey = @"b89b24fe42a86b4bdb2e927a94c364955373766e";
static NSString * const kApiKey = @"e71fe9144c5c61534b270843495561f0";
static NSString * const kApiKeyPath = @"apikey";

static NSString * const kLimit = @"20";
static NSString * const kLimitPath = @"limit";

static NSString * const kOffsetPath = @"offset";

static NSString * const kTimestampPath = @"ts";
static NSString * const kHashPath = @"hash";



@implementation KHMarvelTransport



#pragma mark -
#pragma mark requests

- (void)getMarvelCharactersWithPage:(NSInteger)page success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure{
    
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSString *timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000];
    NSString *keyString = [NSString stringWithFormat:@"%@%@%@",timestamp,kPrivateKey,kApiKey];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@=%@&%@=%@&%@=%ld&%@=%@&%@=%@",kBaseURLString,kMarvelCharactersPath,kApiKeyPath,kApiKey,kLimitPath,kLimit,kOffsetPath,(long)page,kTimestampPath,timestamp,kHashPath,[keyString MD5]]];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            failure(error);
        }else{
            id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            success(obj);
        }
        
    }] resume];
}

@end
