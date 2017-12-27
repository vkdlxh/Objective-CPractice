//
//  ViewController.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
#import "ACARequest.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *teams;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    ACARequest *instance = [[ACARequest alloc] init];
    ACARequest *instance = [ACARequest new];
    [instance getTeamList:^(NSArray *teamList) {
        teams = teamList;
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
    return teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TeamCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSString *title = [NSString stringWithString:teams[indexPath.row]];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
    titleLabel.text = title;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString:@"GoSubViewSegue"]) {
        SubViewController *vc = segue.destinationViewController;
        NSInteger selectedIndex = self.tableView.indexPathForSelectedRow.row;
//        vc.navigationItem.title = teams[selectedIndex];
        vc.team = teams[selectedIndex];
    }
}


@end
