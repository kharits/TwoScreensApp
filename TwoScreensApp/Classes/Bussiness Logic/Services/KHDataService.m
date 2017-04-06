//
//  KHDataService.m
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHDataService.h"
#import "KHMarvelTransport.h"
#import "KHMarvelParser.h"
#import "KHMeta.h"
#import "KHCharacter.h"

static KHDataService *sharedInstance = nil;
static NSString * const kFileName = @"MarvelsCharacters";

@interface KHDataService ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation KHDataService{
    KHMarvelTransport *transport;
    KHMarvelParser *marvelParser;
}

#pragma mark -
#pragma mark inits

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
        transport = [[KHMarvelTransport alloc] init];
        marvelParser = [[KHMarvelParser alloc] init];
    }
    return self;
}

- (void)dealloc{
    [sharedInstance release];
    [self.items release];
    [self.characters release];
    [transport release];
    [marvelParser release];
    [super dealloc];
}

#pragma mark -
#pragma mark Requests

- (void)loadData{
    NSArray *array = [self loadFile];
    if (array) {
        self.items = [NSMutableArray arrayWithArray:[array copy]];
        self.characters = [NSArray arrayWithArray:[array copy]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"charactersUpdate" object:nil];
        [self loadCharactersWithOffset:[self.items count]];
    }else{
        self.items = [NSMutableArray array];
        [self loadCharactersWithOffset:0];
    }
    [array release];
}

- (void)loadCharactersWithOffset:(NSInteger)aOffset{
    
    [transport getMarvelCharactersWithPage:aOffset success:^(NSDictionary *dataDictionary) {
        KHMeta *meta = [marvelParser parseMetaWithJSON:dataDictionary];
        if ([meta.count integerValue] == 0) {
            return ;
        }
        NSArray *characters = [marvelParser parseCharactersWithJSON:dataDictionary];
        dispatch_async(dispatch_get_main_queue(), ^(){
            [self.items addObjectsFromArray:[characters copy]];
            self.characters = [NSArray arrayWithArray:[self.items copy]];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"charactersUpdate" object:nil];
        });
        [self writeFile];
        if ([meta.offset integerValue] + [meta.count integerValue] < [meta.total integerValue]) {
            [self loadCharactersWithOffset:[meta.offset integerValue] + [meta.count integerValue]];
            NSLog(@"count %li",(long)[meta.offset integerValue]);
        }else{
            NSLog(@"Finish Loading");
        }
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)writeFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:kFileName];
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *items = [self.items copy];
    for (KHCharacter *character in items) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict addEntriesFromDictionary:[NSDictionary dictionaryWithObject:character.name forKey:@"name"]];
        [dict addEntriesFromDictionary:[NSDictionary dictionaryWithObject:character.descriptionText forKey:@"descriptionText"]];
        [dict addEntriesFromDictionary:[NSDictionary dictionaryWithObject:character.photoStringsURLPath forKey:@"photoStringsURLPath"]];
        [array addObject:dict];
    }
   BOOL isWrite = [array writeToFile:filePath atomically:YES];
    NSLog(@"isWrite = %i", isWrite);
}

- (NSArray *)loadFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:kFileName];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        KHCharacter *character = [[KHCharacter alloc] init];
        character.name = dict[@"name"];
        character.descriptionText = dict[@"descriptionText"];
        character.photoStringsURLPath = dict[@"photoStringsURLPath"];
        [mArray addObject:character];
    }
    return [mArray copy];
}

@end
