//
//  SubViewController.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSString *_team;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
//@property (nonatomic, weak) NSString *team;
@property (nonatomic, copy) NSArray *groups;

- (NSString *)team;
- (void)setTeam:(NSString *)team;

@end
