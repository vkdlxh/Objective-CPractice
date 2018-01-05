//
//  MemoListViewController.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "MemoListViewController.h"
#import "SubViewController.h"
#import "ACARequest.h"

@interface MemoListViewController ()

@end

@implementation MemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _group;
    
    ACARequest *instance = [ACARequest new];
    [instance getMemoList:_team group:_group completion:^(NSArray *memoList) {
        self.memos = memoList;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Main Thread
            [self.tableView reloadData];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _memos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MemoCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSString *title = [NSString stringWithString:[_memos[indexPath.row] title]];
    cell.textLabel.text = title;
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
