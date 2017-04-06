//
//  KHCommonListTableViewDataSource.m
//  TwoScreensApp
//
//  Created by kharitserg on 31.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCommonListTableViewDataSource.h"
#import "KHCommonListTableViewCell.h"

static NSInteger const kNumberOfSections = 1;

@implementation KHCommonListTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return kNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commonListTableViewCell" forIndexPath:indexPath];
    [((KHCommonListTableViewCell *)cell).photoImageView setImage:[UIImage imageNamed:@"placeholder"]];
    return cell;
    
}



@end
