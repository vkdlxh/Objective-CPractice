//
//  Request.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACARequest : NSObject

- (NSMutableURLRequest *)request:(NSString *)url httpMethod:(NSString *)httpMethod apiToken:(NSString *)apiToken;

- (void)getTeamList:(void (^)(NSArray* teamList))completion;

- (void)getGroupList:(NSString *)domain completion:(void (^)(NSArray* groupList))completion;

- (void)getMemoList:(NSString *)group group:(NSString *)group completion:(void (^)(NSArray* memoList))completion;

@end
