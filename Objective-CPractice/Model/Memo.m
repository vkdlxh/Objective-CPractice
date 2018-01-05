//
//  Memo.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Memo.h"

@implementation Memo

- (id)initMemo:(NSDictionary *)memo {
    
    self = [super init];
    
    if(self) {
        NSInteger memoId = [[memo valueForKey:@"id"] intValue];
        NSString *title = [memo valueForKey:@"title"];
        NSString *body = [memo valueForKey:@"body"];
        BOOL draft = [[memo valueForKey:@"draft"] boolValue];
        NSString *url = [memo valueForKey:@"url"];
        NSString *created_at = [memo valueForKey:@"created_at"];
        NSString *scope = [memo valueForKey:@"scope"];
        
        NSArray *tagsDict = [memo valueForKey:@"tags"];
        if (tagsDict != NULL) {
            for (NSDictionary *tagDict in tagsDict) {
                Tag *tag = [[Tag alloc] initTag:tagDict];
                [self.tags addObject:tag];
            }
        }
        
        NSArray *commentsDict = [memo valueForKey:@"comments"];
        if (commentsDict != NULL) {
            for (NSDictionary *commentDict in commentsDict) {
                Comment *comment = [[Comment alloc] initComment:commentDict];
                [self.comments addObject:comment];
            }
        }
        
        NSArray *groupsDict = [memo valueForKey:@"groups"];
        if (groupsDict != NULL) {
            for (NSDictionary *groupDict in groupsDict) {
                Group *group = [[Group alloc] initGroup:groupDict];
                [self.groups addObject:group];
            }
        }
        
        NSDictionary *userDict = [memo valueForKey:@"user"];
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
