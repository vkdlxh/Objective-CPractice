//
//  Request.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "ACARequest.h"
#import "Team.h"

@implementation ACARequest {
    
}

- (NSMutableArray *)getTeamList {
    NSMutableArray* teams = [[NSMutableArray alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL: [NSURL URLWithString:@"https://api.docbase.io/teams"]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"a4xs7VcTEzscaWnG1Rjp" forHTTPHeaderField:@"X-DocBaseToken"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *e = nil;
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
        
        if (!dict) {
            NSLog(@"Error parsing JSON: %@", e);
        } else {
            for(NSDictionary *item in dict) {
                Team *team = [Team alloc];
                NSString *teamName = [[team initTeam:item] name];
                [teams addObject:teamName];
                NSLog(@"teams: %@", teams);
            }
        }
    }] resume];
    return teams;
}


@end

