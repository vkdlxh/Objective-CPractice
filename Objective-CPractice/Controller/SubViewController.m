//
//  SubViewController.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "SubViewController.h"
#import "MemoListViewController.h"
#import "ACARequest.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _team;
    
    ACARequest *instance = [ACARequest new];
    [instance getGroupList:_team completion:^(NSArray *groupList) {
        self.groups = groupList;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Main Thread
            [self.tableView reloadData];
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"GroupCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSString *title = [NSString stringWithString:_groups[indexPath.row]];
    cell.textLabel.text = title;

    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString:@"GoMemoListSegue"]) {
        MemoListViewController *vc = segue.destinationViewController;
        NSInteger selectedIndex = self.tableView.indexPathForSelectedRow.row;
        vc.group = _groups[selectedIndex];
        vc.team = _team;
    }
}


@end
