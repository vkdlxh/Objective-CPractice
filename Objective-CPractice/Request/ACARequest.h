//
//  Request.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACARequest : NSObject

- (void)getTeamList:(void (^)(NSArray* teamList))completion;

- (void)getGroupList:(NSString *)domain completion:(void (^)(NSArray* groupList))completion;

@end
