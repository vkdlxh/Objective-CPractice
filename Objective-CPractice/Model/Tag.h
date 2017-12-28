//
//  Tag.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tag:NSObject

@property (nonatomic, strong) NSString *name;

- (id)initTag:(NSDictionary *)tag;

@end
