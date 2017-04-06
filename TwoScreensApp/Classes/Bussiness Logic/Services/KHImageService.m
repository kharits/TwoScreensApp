//
//  KHImageService.m
//  TwoScreensApp
//
//  Created by kharitserg on 05.04.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHImageService.h"
#import "KHTransport.h"

static KHImageService *sharedInstance = nil;

@implementation KHImageService{
    KHTransport *transport;
}

+ (instancetype)sharedInstance
{
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[super allocWithZone:NULL] init];
        }
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (NSUInteger)retainCount {
    return UINT_MAX;
}

- (oneway void)release {
    
}
- (id)autorelease {
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        transport = [[KHTransport alloc] init];
    }
    return self;
}

- (void)dealloc{
    [transport release];
    [super dealloc];
}

- (void)loadPhotoWithLink:(NSString *)urlString success:(void (^)(NSData *))success failure:(void(^)(NSError *error))failure{
    [transport loadPhotoWithURLString:urlString success:^(NSData *photo) {
        success(photo);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
