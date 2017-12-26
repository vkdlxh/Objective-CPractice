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
    NSMutableArray *titleArray;
    NSMutableArray *bodyArray;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    titleArray = @[@"title1",@"title2",@"title3",@"title4",@"title5"];
//    bodyArray = @[@"body1",@"body2",@"body3",@"body4",@"body5"];
    
    ACARequest *instance = [[ACARequest alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Background operations
        titleArray = [instance getTeamList];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Main Thread
            [self.tableView reloadData];
            NSLog(@"titleArray = %@", titleArray);
        });
    });
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
    
    NSString *body = [NSString stringWithString:bodyArray[indexPath.row]];
    UILabel *bodyLabel = (UILabel *)[cell viewWithTag:2];
    bodyLabel.text = body;
    
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
