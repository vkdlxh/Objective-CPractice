//
//  Memo.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Comment.h"
#import "Tag.h"
#import "Group.h"

@interface Memo: NSObject

@property (nonatomic, assign) NSInteger memoId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) BOOL draft;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSMutableArray *tags;
@property (nonatomic, strong) NSString *scope;
@property (nonatomic, strong) NSMutableArray *groups;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSMutableArray *comments;

- (id) initMemo:(NSDictionary *)memo;

@end
