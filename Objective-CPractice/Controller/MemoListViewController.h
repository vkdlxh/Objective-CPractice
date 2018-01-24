//
//  MemoListViewController.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoListViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *memos;

-(void)addTapped: (UIBarButtonItem *)sender;

@end
