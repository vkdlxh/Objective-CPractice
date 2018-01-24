//
//  Request.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"

@interface ACARequest : NSObject

@property (nonatomic, strong) NSString *team;
@property (nonatomic, strong) Group *group;

+ (id)sharedManager;

- (NSMutableURLRequest *)request:(NSString *)url httpMethod:(NSString *)httpMethod apiToken:(NSString *)apiToken;

- (void)getTeamList:(void (^)(NSArray* teamList))completion;

- (void)getGroupList:(void (^)(NSArray *))completion;

- (void)getMemoList:(void (^)(NSArray* memoList))completion;

- (void)writeMemo:(NSDictionary *)dict completion:(void (^)(BOOL))completion;



@end
