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
    NSArray *titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    ACARequest *instance = [[ACARequest alloc] init];
        // Background operations
    [instance getTeamList:^(NSArray *teamList) {
        titleArray = teamList;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Main Thread
            [self.tableView reloadData];
            NSLog(@"titleArray = %@", titleArray);
        });
    }];
}
    

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"tableCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSString *title = [NSString stringWithString:titleArray[indexPath.row]];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
    titleLabel.text = title;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString:@"GoSubViewSegue"]) {
        SubViewController *vc = segue.destinationViewController;
        NSInteger selectedIndex = self.tableView.indexPathForSelectedRow.row;
        vc.navigationItem.title = titleArray[selectedIndex];
    }
}


@end
