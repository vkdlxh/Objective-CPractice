//
//  Team.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (nonatomic, strong) NSString *domain;
@property (nonatomic, strong) NSString *name;

- (id) initTeam:(NSDictionary *)team;

@end
