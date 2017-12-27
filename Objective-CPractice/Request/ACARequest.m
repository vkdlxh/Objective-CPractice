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

-(NSMutableURLRequest *)request:(NSString *)url httpMethod:(NSString *)httpMethod apiToken:(NSString *)apiToken {
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    
    [request setURL: [NSURL URLWithString:url]];
    [request setHTTPMethod:httpMethod];
    [request setValue:apiToken forHTTPHeaderField:@"X-DocBaseToken"];
    
    return request;
}

- (void)getTeamList:(void (^)(NSArray* teamList))completion {
    NSMutableArray* teams = [[NSMutableArray alloc] init];
    NSString *url = @"https://api.docbase.io/teams";
    NSString *httpMethod = @"GET";
    NSString *apiToken = @"8ZwKUqC7QkJJKZN2hP2i";
    
    NSMutableURLRequest *request = [self request:url httpMethod:httpMethod apiToken:apiToken];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *e = nil;
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
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
    NSString *url = [NSString stringWithFormat:@"https://api.docbase.io/teams/%@/groups",domain];
    NSString *httpMethod = @"GET";
    NSString *apiToken = @"8ZwKUqC7QkJJKZN2hP2i";
    
    NSMutableURLRequest *request = [self request:url httpMethod:httpMethod apiToken:apiToken];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *e = nil;
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
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

