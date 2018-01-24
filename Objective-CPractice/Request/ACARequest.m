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
#import "Memo.h"

@implementation ACARequest {
    
}

+ (id)sharedManager {
    static ACARequest *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
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
    NSString *apiToken = @"a4xs7VcTEzscaWnG1Rjp";
    
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

-(void)getGroupList:(void (^)(NSArray *))completion {
    NSMutableArray* groups = [[NSMutableArray alloc] init];
    NSString *url = [NSString stringWithFormat:@"https://api.docbase.io/teams/%@/groups",_team];
    NSString *httpMethod = @"GET";
    NSString *apiToken = @"a4xs7VcTEzscaWnG1Rjp";
    
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
                Group *group = [[Group alloc] initGroup:item];
//                NSString *groupName = [group initGroup:item];
                [groups addObject:group];
            }
            completion(groups);
        }
    }] resume];
}

-(void)getMemoList:(void (^)(NSArray *))completion {
    NSMutableArray* memos = [[NSMutableArray alloc] init];
    NSString *url = [NSString stringWithFormat:@"https://api.docbase.io/teams/%@/posts?q=group:%@",_team, _group.name];
    NSString *encodingURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *httpMethod = @"GET";
    NSString *apiToken = @"a4xs7VcTEzscaWnG1Rjp";
    
    NSMutableURLRequest *request = [self request:encodingURL httpMethod:httpMethod apiToken:apiToken];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *e = nil;
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSLog(@"MemoList Response result : %@", [dict description]);
        if ([httpResponse statusCode] != 200) {
            NSLog(@"statusCode should be 200, but is %ld",(long)[httpResponse statusCode]);
            completion(NULL);
            return;
        }
        
        if (!dict) {
            NSLog(@"Error parsing JSON: %@", e);
        } else {
            for (NSDictionary *post in [dict objectForKey:@"posts"]) {
                Memo *memo = [[Memo new] initMemo:post];
                [memos addObject:memo];
                NSLog(@"%@",memo);
            }
            completion(memos);
        }
    }] resume];
    
}

-(void) writeMemo:(NSDictionary *)dict completion:(void (^)(BOOL))completion {
    NSString *url = [NSString stringWithFormat:@"https://api.docbase.io/teams/%@/posts",_team];
    NSString *httpMethod = @"POST";
    NSString *apiToken = @"a4xs7VcTEzscaWnG1Rjp";
    
    NSMutableURLRequest *request = [self request:url httpMethod:httpMethod apiToken:apiToken];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
  
    NSData *httpBody = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    [request setHTTPBody:httpBody];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSLog(@"MemoList Response result : %@", [dict description]);
        if ([httpResponse statusCode] != 201) {
            NSLog(@"statusCode should be 201, but is %ld",(long)[httpResponse statusCode]);
            NSLog(@"%@", response);
            completion(NO);
            return;
        } else {
            completion(YES);
        }
        
//        if (!dict) {
//            NSLog(@"Error parsing JSON: %@", e);
//        } else {
//
//        }
    }] resume];
}


@end

