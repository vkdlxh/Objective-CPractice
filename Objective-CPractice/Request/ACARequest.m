//
//  Request.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "ACARequest.h"
#import "Team.h"
#import "Group.h"

@implementation ACARequest {
    
}

- (void)getTeamList:(void (^)(NSArray* teamList))completion {
    NSMutableArray* teams = [[NSMutableArray alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL: [NSURL URLWithString:@"https://api.docbase.io/teams"]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"a4xs7VcTEzscaWnG1Rjp" forHTTPHeaderField:@"X-DocBaseToken"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *e = nil;
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
//        NSLog(@"Response : %@",response);
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse statusCode] != 200) {
            NSLog(@"statusCode should be 200, but is %ld",(long)[httpResponse statusCode]);
            completion(NULL);
            return;
        }
        
        if (!dict) {
            NSLog(@"Error parsing JSON: %@", e);
        } else {
            for(NSDictionary *item in dict) {
                Team *team = [Team alloc];
                NSString *teamName = [[team initTeam:item] name];
                [teams addObject:teamName];
                NSLog(@"teams: %@", teams);
            }
            completion(teams);
        }
    }] resume];
}

-(void)getGroupList:(NSString *)domain completion:(void (^)(NSArray *))completion {
    NSMutableArray* groups = [[NSMutableArray alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *urlString = [NSString stringWithFormat:@"https://api.docbase.io/teams/%@/groups",domain];
    
    [request setURL: [NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"a4xs7VcTEzscaWnG1Rjp" forHTTPHeaderField:@"X-DocBaseToken"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *e = nil;
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
        //        NSLog(@"Response : %@",response);
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse statusCode] != 200) {
            NSLog(@"statusCode should be 200, but is %ld",(long)[httpResponse statusCode]);
            completion(NULL);
            return;
        }
        
        if (!dict) {
            NSLog(@"Error parsing JSON: %@", e);
        } else {
            for(NSDictionary *item in dict) {
                Group *group = [Group alloc];
                NSString *groupName = [[group initGroup:item] name];
                [groups addObject:groupName];
            }
            completion(groups);
        }
    }] resume];
}


@end

