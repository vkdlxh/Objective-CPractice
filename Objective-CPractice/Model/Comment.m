//
//  Comment.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Comment.h"

@implementation Comment

@synthesize commentId;
@synthesize body;
@synthesize created_at;
@synthesize user;

- (id) initComment:(NSDictionary *)comment {
    self = [super init];
    
    if(self) {
        NSInteger commentId = [[comment valueForKey:@"id"] intValue];
        NSString *body = [comment valueForKey:@"body"];
        NSString *created_at = [comment valueForKey:@"created_at"];
        NSDictionary *userDict = [comment valueForKey:@"user"];
        User *user = [[User alloc] initUser:userDict];

        self.commentId = commentId;
        self.body = body;
        self.created_at = created_at;
        self.user = user;
    }
    
    return self;
}

@end
