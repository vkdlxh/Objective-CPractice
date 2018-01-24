//
//  WriteMemoViewController.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2018/01/24.
//  Copyright © 2018年 jeonsangjun. All rights reserved.
//

#import "WriteMemoViewController.h"
#import "MemoListViewController.h"
#import "ACARequest.h"

@interface WriteMemoViewController ()

@end

@implementation WriteMemoViewController

- (IBAction)writeAction:(id)sender {
    ACARequest *instance = [ACARequest sharedManager];
    
    NSInteger groupId = instance.group.groupId;
    NSMutableArray *groups = [NSMutableArray new];
    [groups addObject:[NSNumber numberWithInteger:groupId]];
    NSMutableArray *tags = [NSMutableArray new];
    [tags addObject:@"test tagdesu."];

    NSDictionary *dict = @{@"title" : @"Objective-C Title",
             @"body": @"Objective-C Body" ,
             @"draft": @NO,
             @"tags": tags,
             @"scope": @"group",
             @"groups": groups,
             @"notice": @YES
             };
    [instance writeMemo:dict completion:^(BOOL result) {
        if (result) {
            NSLog(@"success write memo.");
        } else {
            NSLog(@"fail write memo.");
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
