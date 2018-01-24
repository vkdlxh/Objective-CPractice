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
#import "Memo.h"

@interface MemoListViewController ()

@end

@implementation MemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ACARequest *instance = [ACARequest sharedManager];
    self.navigationItem.title = instance.group.name;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(addTapped:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    [instance getMemoList:^(NSArray *memoList) {
        self.memos = memoList;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Main Thread
            [self.tableView reloadData];
        });
    }];
}

- (void)addTapped:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"GoWriteMemoSegue" sender:self];
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
    
    UILabel *titleLabel = [cell viewWithTag:1];
    UILabel *bodylabel = [cell viewWithTag:2];
    
    Memo *memo = (Memo *)_memos[indexPath.row];
    NSString *title = [NSString stringWithString:[memo title]];
    NSString *body = [NSString stringWithString:[memo body]];
    
    titleLabel.text = title;
    bodylabel.text = body;
    
    
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
