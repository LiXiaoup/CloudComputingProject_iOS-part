//
//  dbImage.m
//  Cloud
//
//  Created by JinQiurui on 5/23/15.
//  Copyright (c) 2015 JinQiurui. All rights reserved.
//

#import "dbImage.h"

@implementation dbImage
static NSString* const kBaseURL = @"http://160.39.196.152:3000/";
static NSString* const kUpload = @"files";
static NSString* const kSearch = @"searchIOS";
NSString *name;

+(NSMutableArray *) searchImage:(UIImage *)image imageName:(NSString *)name{
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    //firstly let's upload the image
    
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kSearch]]; //1
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //3
    
    
    NSString* queryString = [NSString stringWithFormat:@"{\"imageName\":\"%@.png\"}",name];
    NSLog(@"%@",queryString);
    
    
    
    NSData* data = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSError *e = nil;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
            for(int i=0;i<6;i++)
            {
                NSDictionary *item =  [jsonArray objectAtIndex:i];
                NSString *url = [item objectForKey:@"url"];
                //NSLog(@"url: %@",url);
                NSString *title = [item objectForKey:@"title"];
                //NSLog(@"title: %@",title);
                NSString *content = [item objectForKey:@"content"];
                //NSLog(@"content: %@",content);
                NSString *origin = [item objectForKey:@"origin"];
                //NSLog(@"origin: %@",origin);
                NSString *brand = @"brand";
                NSString *height = @"height";
                NSString *width = @"width";
                //[item objectForKey:@"brand"];
                //NSLog(@"brand: %@",brand);
                dbImage *image = [[dbImage alloc] initwithUrl:url title:title content:content origin:origin brand:brand height:height width:width];
                [searchResult addObject:image];
            }
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    
    [dataTask resume];
 
    return searchResult;
}

+(NSString *) uploadImage:(UIImage *)image
{
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kUpload]]; //1
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST"; //2
    [request addValue:@"image/png" forHTTPHeaderField:@"Content-Type"]; //3
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSData* bytes = UIImagePNGRepresentation(image); //4
    NSURLSessionUploadTask* task = [session uploadTaskWithRequest:request fromData:bytes completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"success:%@",myString);
           // name = myString;
           // NSLog(name);
             NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             name = [responseDict objectForKey:@"_id"];
           
            //NSLog(@"%@",responseDict);
        }
        else
        {
            NSLog(@"error:%@",error);
        }
    }];
    [task resume];
    while (!name) {
        sleep(1);
        NSLog(@"Waiting for uploading");
    }
    
    return name;
}

-(id) initwithUrl:(NSString *) url title:(NSString *) title content:(NSString *) content origin:(NSString *) origin brand:(NSString *) brand height:(NSString *) height width:(NSString *)width
{
    _url = url;
    _title = title;
    _content = content;
    _origin = origin;
    _brand = brand;
    _height = height;
    _width = width;
    return self;
}
-(NSString *)url
{
    return _url;
}
-(NSString *)title
{
    return _title;
}
-(NSString *)content
{
    return _content;
}
-(NSString *)origin
{
    return _origin;
}
-(NSString *)brand
{
    return _brand;
}
-(NSString *)width
{
    return _width;
}
-(NSString *)height
{
    return _height;
}

@end
