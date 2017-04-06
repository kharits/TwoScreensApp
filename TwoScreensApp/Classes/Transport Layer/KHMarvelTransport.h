//
//  KHMarvelTransport.h
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHMarvelTransport : NSObject

- (void)getMarvelCharactersWithPage:(NSInteger)page success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure;

@end
