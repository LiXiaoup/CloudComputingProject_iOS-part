//
//  dbUser.m
//  Cloud
//
//  Created by JinQiurui on 5/21/15.
//  Copyright (c) 2015 JinQiurui. All rights reserved.
//

#import "dbUser.h"

static NSString* const kBaseURL = @"http://160.39.196.65:8081/";
static NSString* const kUserInfo = @"userinfo";

@implementation dbUser
dbUser *user;


+(dbUser *) getUserInfo:(NSString *) username {
    //dbUser *user = [[dbUser alloc] init];
    //dbUser *user;
    
    NSString* queryString = [NSString stringWithFormat:@"name=%@",username];
    NSString* query = [NSString stringWithFormat:@"?%@", queryString];
    
    
    NSString* urlStr = [[kBaseURL stringByAppendingPathComponent:kUserInfo] stringByAppendingString:query]; //1
    NSURL* url = [NSURL URLWithString:urlStr];
    
//    NSLog(@"%@",urlStr);
    
//    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kUserInfo]];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; //3
    
    
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",myString);
            NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSString* email = responseDict[@"email"];
            NSString* username =responseDict[@"name"];
            NSString* pwd = responseDict[@"name"];
            NSString* start_time = responseDict[@"start"];
            NSString* bio = responseDict[@"bio"];
            NSLog(@"%@",responseDict[@"name"]);
            user = [[dbUser alloc] initWithEmail:email username:username pwd:pwd start_time:start_time bio:bio];
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    
    [dataTask resume];
    
    while(!user.username)
    {
        NSLog(@"%@",user.username);
        sleep(0.1);
    }
    
    
    return user;
}

-(id) initWithEmail:(NSString *) email username:(NSString *) username pwd:(NSString *) pwd start_time:(NSString *) start_time bio:(NSString *)bio{
    _email = email;
    _username = username;
    _pwd = pwd;
    _start_date = start_time;
    _bio = bio;
    return self;
}
-(NSString *) email
{
    return _email;
}
-(NSString *) username
{
    return _username;
}
-(NSString *) pwd
{
    return _pwd;
}
-(NSString *) start_time
{
    return _start_date;
}
-(NSString *) bio
{
    return _bio;
}

@end



