//
//  Memo.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Memo.h"

@implementation Memo

- (id)initGroup:(NSDictionary *)group {
    
    self = [super init];
    
    if(self) {
        NSInteger memoId = [[group valueForKey:@"id"] intValue];
        NSString *title = [group valueForKey:@"title"];
        NSString *body = [group valueForKey:@"body"];
        BOOL draft = [[group valueForKey:@"draft"] boolValue];
        NSString *url = [group valueForKey:@"url"];
        NSString *created_at = [group valueForKey:@"created_at"];
        NSString *scope = [group valueForKey:@"scope"];
        
        NSArray *tagsDict = [group valueForKey:@"tags"];
        if (tagsDict != NULL) {
            for (NSDictionary *tagDict in tagsDict) {
                Tag *tag = [[Tag alloc] initTag:tagDict];
                [self.tags addObject:tag];
            }
        }
        
        NSArray *commentsDict = [group valueForKey:@"comments"];
        if (commentsDict != NULL) {
            for (NSDictionary *commentDict in commentsDict) {
                Comment *comment = [[Comment alloc] initComment:commentDict];
                [self.comments addObject:comment];
            }
        }
        
        NSArray *groupsDict = [group valueForKey:@"groups"];
        if (groupsDict != NULL) {
            for (NSDictionary *groupDict in groupsDict) {
                Group *group = [[Group alloc] initGroup:groupDict];
                [self.groups addObject:group];
            }
        }
        
        NSDictionary *userDict = [group valueForKey:@"user"];
        User *user = [[User alloc] initUser:userDict];
        
        self.memoId = memoId;
        self.title = title;
        self.body = body;
        self.draft = draft;
        self.url = url;
        self.created_at = created_at;
        self.scope = scope;
        self.user = user;
    }
    
    return self;
}

@end
