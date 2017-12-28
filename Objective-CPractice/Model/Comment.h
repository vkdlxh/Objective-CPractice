//
//  Comment.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"


@interface Comment:NSObject

@property (nonatomic, assign) NSInteger commentId;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) User *user;

- (id) initComment:(NSDictionary *)comment;

@end
