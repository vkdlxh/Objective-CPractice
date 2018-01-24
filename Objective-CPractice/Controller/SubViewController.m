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
    ACARequest *instance = [ACARequest sharedManager];
    self.navigationItem.title = instance.team;
    
    [instance getGroupList: ^(NSArray *groupList) {
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
    Group *group = (Group *)_groups[indexPath.row];
    NSString *title = [NSString stringWithString:group.name];
    cell.textLabel.text = title;

    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString:@"GoMemoListSegue"]) {
        NSInteger selectedIndex = self.tableView.indexPathForSelectedRow.row;
        
        ACARequest *instance = [ACARequest sharedManager];
        instance.group = _groups[selectedIndex];
    }
}


@end
