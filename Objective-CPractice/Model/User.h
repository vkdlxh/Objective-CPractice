//
//  User.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User:NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profile_image_url;

- (id) initUser:(NSDictionary *)user;

@end

