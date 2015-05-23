//
//  dbImage.h
//  Cloud
//
//  Created by JinQiurui on 5/23/15.
//  Copyright (c) 2015 JinQiurui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dbImage : NSObject{
    NSString* _url;
    NSString* _title;
    NSString* _content;
    NSString* _origin;
    NSString* _brand;
}

-(NSString *)url;
-(NSString *)title;
-(NSString *)content;
-(NSString *)origin;
-(NSString *)brand;
@end
