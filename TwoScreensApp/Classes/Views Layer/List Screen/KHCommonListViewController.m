//
//  KHCommonListViewController.m
//  TwoScreensApp
//
//  Created by kharitserg on 30.03.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "KHCommonListViewController.h"
#import "KHCommonListTableViewDataSource.h"
#import "KHCommonListTableViewCell.h"
#import "KHCommonListTableViewCell+Marvel.h"
#import "KHCharacterViewController.h"

@interface KHCommonListViewController () <UITableViewDelegate>

@end

@implementation KHCommonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDataSource];
}

- (void)setupDataSource{
    self.dataSource.items = self.dataService.characters;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changedData) name:@"charactersUpdate" object:nil];
}

- (void)changedData{
    NSInteger start = [self.dataSource.items count];
    NSInteger cancel = [self.dataService.characters count];
    self.dataSource.items = self.dataService.characters;
    
    NSMutableArray *paths = [NSMutableArray array];
    for (NSInteger i = start; i < cancel; i++) {
        [paths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_tableView release];
    [_dataSource release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [(KHCommonListTableViewCell *)cell setupDataWithCharacter:[self.dataSource.items objectAtIndex:indexPath.row]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"showDetailView" sender:[self.dataSource.items objectAtIndex:indexPath.row]];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showDetailView"]) {
        KHCharacterViewController *vc = (KHCharacterViewController *)segue.destinationViewController;
        vc.character = sender;
    }
    
}
@end
