//
//  IndividualResult.m
//  SearchResult
//
//  Created by 宛丁 黎 on 5/9/15.
//  Copyright (c) 2015 Wanding Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "IndividualResult.h"
#import "ResultGroup.h"

@interface IndividualResult ()

@end
static NSString* const kBaseURL = @"http://160.39.196.152:3000/";
static NSString* const kRelate = @"relate";

@implementation IndividualResult

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor* mainColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:0.8f];
    UIColor* labelColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.4f];
    UIColor* textColor = [UIColor whiteColor];
    
    NSString* fontName = @"GillSans-Italic";
    NSString* boldFontName = @"GillSans-Bold";
    
    self.individualResultButtonView.tintColor =  [UIColor whiteColor];
    self.individualResultBrandView.tintColor =  [UIColor whiteColor];
    self.individualResultPriceView.tintColor =  [UIColor whiteColor];
    
    UIFont* countLabelFont = [UIFont fontWithName:fontName size:15.0f];
    self.individualResultPriceLabel.textColor =  textColor;
    self.individualResultPriceLabel.font =  countLabelFont;
    self.individualResultPriceLabel.text = self.image.content;
    self.individualResultPriceLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.individualResultPriceLabel.numberOfLines = 0;
    
    UIFont* socialFont = [UIFont fontWithName:fontName size:15.0f];
    UIFont* labelFont = [UIFont fontWithName:fontName size:20.0f];
    UIColor* socialColor = [UIColor lightGrayColor];
    
    self.individualResultBrandLabel.textColor =  textColor;
    self.individualResultBrandLabel.font =  labelFont;
    self.individualResultBrandLabel.text = @"Brand";
    
    self.individualResultDescriptionLabel.textColor =  textColor;
    self.individualResultDescriptionLabel.font =  socialFont;
    self.individualResultDescriptionLabel.text = self.image.title;
    
    self.individualResultDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.individualResultDescriptionLabel.numberOfLines = 0;
    
    //self.individualResultBgImageView.image = [UIImage imageNamed:@"pink_bg2.jpg"];
    //self.individualResultBgImageView.backgroundColor = mainColor;
    
    
    //image url here
    NSURL *url = [NSURL URLWithString:[self.image url]];
    NSData *data= [[NSData alloc] initWithContentsOfURL:url];
    self.individualResultImageView.image = [[UIImage alloc] initWithData:data];
    self.individualResultImageView.alpha = 0.95f;
    self.individualResultImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.individualResultImageView.clipsToBounds = YES;
    
    CALayer *lay  = self.individualResultImageView.layer;//获取ImageView的层
    [lay setMasksToBounds:YES];
    [lay setCornerRadius:3.0];//值越大，角度越圆
    
    CALayer *lay1  = self.individualResultBrandView.layer;//获取ImageView的层
    [lay1 setMasksToBounds:YES];
    [lay1 setCornerRadius:5.0];//值越大，角度越圆
    
    CALayer *lay2  = self.individualResultPriceView.layer;//获取ImageView的层
    [lay2 setMasksToBounds:YES];
    [lay2 setCornerRadius:5.0];//值越大，角度越圆
    
    self.individualResultBrandView.backgroundColor = mainColor;
    self.individualResultPriceView.backgroundColor = mainColor;
   // self.individualResultButtonView.backgroundColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
    self.individualResultBgView.backgroundColor = [UIColor whiteColor];
    
    //UIButton* individualResultLikeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.individualResultLikeButton setTitle:@"Like" forState:UIControlStateNormal];
    [self.individualResultLikeButton sizeToFit];
    self.individualResultLikeButton.center = CGPointMake(121, 623);
    
    //Add action when Like Button Pressed
    [self.individualResultLikeButton addTarget:self action:@selector(likeButtonPressed:)
                         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.individualResultLikeButton];
    
    
    //UIButton* individualResultShopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.individualResultShopButton setTitle:@"Shop" forState:UIControlStateNormal];
    [self.individualResultShopButton sizeToFit];
    self.individualResultShopButton.center = CGPointMake(279, 623);
    
    
    //Add action when Shop Button Pressed
    [self.individualResultShopButton addTarget:self action:@selector(shopButtonPressed:)
                         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.individualResultShopButton];
    
   // self.buttonView.backgroundColor = mainColor;
     
}

-(IBAction)toggleNav:(id)sender{
    BOOL hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
}

-(void)likeButtonPressed:(UIButton*)individualResultLikeButton {
        NSLog(@"Like Button Pressed");}

-(void)shopButtonPressed:(UIButton*)individualResultShopButton {
        NSLog(@"Shop Button Pressed");}
    
-(void)styleSearchResultImage:(UIImageView*)imageView withImageNamed:(NSString*)imageName andColor:(UIColor*)color{
    
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 30.0f;
    imageView.layer.borderWidth = 4.0f;
    imageView.layer.borderColor = color.CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shopButton:(id)sender {
    NSString *shopLink = self.image.origin;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:shopLink]];
}

- (IBAction)likeButton:(id)sender {
    /*NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kRelate]]; //1
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //3
    
    NSString* queryStringBase = [NSString stringWithFormat:@"\"base\":\"%@\"",self.inputImageUrl];
   // NSString* queryStringData = [NSString stringWithFormat:@"\"data\":{\"width\":\"%@\",\"height\":\"%@\",\"url\":\"%@\",\"title\":\"%@\",\"content\":\"%@\",\"origin\":\"%@\",\"brand\":\"%@\"}",self.image.width,self.image.height,self.image.url,self.image.title,self.image.content,self.image.origin,self.image.brand];
    NSString* queryStringData = [NSString stringWithFormat:@"\"data\":%@",self.image.url];
    NSLog(@"%@",queryStringBase);
    NSString* query = [NSString stringWithFormat:@"{%@,%@}", queryStringBase, queryStringData];
    
   // NSString* queryString = [NSString stringWithFormat:@"{\"imageName\":\"%@.png\"}",name];
    NSLog(@"%@",query);
    
    NSData* data = [query dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",myString);
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    
    [dataTask resume];
    */
    
    NSLog(@"1");
   NSString* queryStringBase = [NSString stringWithFormat:@"base=%@",self.inputImageUrl];
     NSLog(@"2");
    NSString* queryStringData = [NSString stringWithFormat:@"data=%@",self.image.url];
     NSLog(@"%@",queryStringBase);
    NSString* query = [NSString stringWithFormat:@"?%@&%@", queryStringBase, queryStringData];
     NSLog(@"%@",query);
    NSString* urlStr = [[kBaseURL stringByAppendingPathComponent:kRelate] stringByAppendingString:query]; //1
     NSLog(@"%@",urlStr);
  //  urlStr = @"http://160.39.196.152:3000/relate?base=https://s3-us-west-2.amazonaws.com/cloud.snapscout/55612a6a4bda44220cb1d4dc.png&data={\"a\":b}";
    NSURL* url = [NSURL URLWithString:urlStr];
    NSLog(@"the url is %@",url);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; //3
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",myString);
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    
    [dataTask resume];

}

- (IBAction)backButton:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ResultGroup *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"ResultGroup"];
    second.result = self.result;
    second.image = self.inputImage;
    [self presentViewController:second animated:YES completion:nil];
}
@end


