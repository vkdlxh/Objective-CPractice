//
//  SubViewController.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSString *team;
}

@property IBOutlet UITableView *tableView;
@property (retain) NSString *team;

@end
