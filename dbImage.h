//
//  dbImage.h
//  Cloud
//
//  Created by JinQiurui on 5/23/15.
//  Copyright (c) 2015 JinQiurui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface dbImage : NSObject{
    NSString* _url;
    NSString* _title;
    NSString* _content;
    NSString* _origin;
    NSString* _brand;
    NSString* _width;
    NSString* _height;
}

+(NSMutableArray *) searchImage:(UIImage *) image imageName:(NSString *)name;
+(NSString *) uploadImage:(UIImage *)image;
-(id) initwithUrl:(NSString *) url title:(NSString *) title content:(NSString *) content origin:(NSString *) origin brand:(NSString *) brand height:(NSString *) height width:(NSString *)width;
-(NSString *)url;
-(NSString *)title;
-(NSString *)content;
-(NSString *)origin;
-(NSString *)brand;
-(NSString *)width;
-(NSString *)height;
@end
