//
//  dbUser.h
//  Cloud
//
//  Created by JinQiurui on 5/21/15.
//  Copyright (c) 2015 JinQiurui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dbUser : NSObject{
    NSString* _email;
    NSString* _username;
    NSString* _pwd;
    NSString* _start_date;
    NSString* _bio;
}

+(dbUser *) getUserInfo:(NSString *)username;
-(id) initWithEmail:(NSString *) email username:(NSString *) username pwd:(NSString *) pwd start_time:(NSString *) start_time bio:(NSString *)bio;
-(NSString *) email;
-(NSString *) username;
-(NSString *) pwd;
-(NSString *) start_time;
-(NSString *) bio;
@end

