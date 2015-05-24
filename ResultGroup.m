//
//  ResultGroup.m
//  SearchResult
//
//  Created by 宛丁 黎 on 5/9/15.
//  Copyright (c) 2015 Wanding Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "ResultGroup.h"
#import "IndividualResult.h"

@interface ResultGroup ()
@end

@implementation ResultGroup

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
    
    UIColor* mainColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:0.2f];
    
   // [self.navigationController.navigationBar setBarTintColor:mainColor];
    
    NSString* fontName = @"GillSans-Italic";
    NSString* boldFontName = @"GillSans-Bold";
    
    self.resultGroupTitleView.tintColor =  [UIColor whiteColor];
    self.resultGroupBgImageView.image = [UIImage imageNamed:@"pink_bg2.jpg"];
    
    //self.resultGroupBgImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    self.resultGroupTitleView.backgroundColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
    self.bottomView.backgroundColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
    NSLog(@"we are here");
    
    if([self.flag isEqual:@"hey"])
    {
        NSURL *url = [NSURL URLWithString:self.inputImageUrl];
        NSData *data= [[NSData alloc] initWithContentsOfURL:url];
        
        self.resultGroupObjectImageView.image = [[UIImage alloc] initWithData:data];
        self.resultGroupObjectImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.resultGroupObjectImageView.clipsToBounds = YES;
        
        
        CALayer *lay  = self.resultGroupObjectImageView.layer;//获取ImageView的层
        [lay setMasksToBounds:YES];
        [lay setCornerRadius:3.0];//值越大，角度越圆
        
        NSURL *url1 = [NSURL URLWithString:[self.result objectAtIndex:0]];
        
        NSLog(@"the image url is %@",[self.result objectAtIndex:0]);
        
        NSData *data1= [[NSData alloc] initWithContentsOfURL:url1];
        self.resultGroupImageView1.image = [[UIImage alloc] initWithData:data1];
        
        CALayer *lay1  = self.resultGroupImageView1.layer;//获取ImageView的层
        [lay1 setMasksToBounds:YES];
        [lay1 setCornerRadius:3.0];//值越大，角度越圆
        NSLog(@"finish");
        if(self.result.count >= 2)
        {
            NSURL *url2 = [NSURL URLWithString:[self.result objectAtIndex:1]];
            NSData *data2= [[NSData alloc] initWithContentsOfURL:url2];
            self.resultGroupImageView2.image = [[UIImage alloc] initWithData:data2];
            
            CALayer *lay2  = self.resultGroupImageView2.layer;//获取ImageView的层
            [lay2 setMasksToBounds:YES];
            [lay2 setCornerRadius:3.0];//值越大，角度越圆
        }
        
        if(self.result.count >= 3)
        {
            NSURL *url3 = [NSURL URLWithString:[self.result objectAtIndex:2]];
            NSData *data3= [[NSData alloc] initWithContentsOfURL:url3];
            self.resultGroupImageView3.image = [[UIImage alloc] initWithData:data3];
            
            CALayer *lay3  = self.resultGroupImageView3.layer;//获取ImageView的层
            [lay3 setMasksToBounds:YES];
            [lay3 setCornerRadius:3.0];//值越大，角度越圆
        }
        
        if(self.result.count >= 4)
        {
            NSURL *url4 = [NSURL URLWithString:[self.result objectAtIndex:3]];
            NSData *data4= [[NSData alloc] initWithContentsOfURL:url4];
            self.resultGroupImageView4.image = [[UIImage alloc] initWithData:data4];
            
            CALayer *lay4  = self.resultGroupImageView1.layer;//获取ImageView的层
            [lay4 setMasksToBounds:YES];
            [lay4 setCornerRadius:3.0];//值越大，角度越圆
        }
        
        if(self.result.count >= 5)
        {
            NSURL *url5 = [NSURL URLWithString:[self.result objectAtIndex:4]];
            NSData *data5= [[NSData alloc] initWithContentsOfURL:url5];
            self.resultGroupImageView5.image = [[UIImage alloc] initWithData:data5];
            
            CALayer *lay5  = self.resultGroupImageView2.layer;//获取ImageView的层
            [lay5 setMasksToBounds:YES];
            [lay5 setCornerRadius:3.0];//值越大，角度越圆
        }
        
        if(self.result.count >= 6)
        {
            NSURL *url6 = [NSURL URLWithString:[self.result objectAtIndex:5]];
            NSData *data6= [[NSData alloc] initWithContentsOfURL:url6];
            self.resultGroupImageView6.image = [[UIImage alloc] initWithData:data6];
            
            CALayer *lay6  = self.resultGroupImageView3.layer;//获取ImageView的层
            [lay6 setMasksToBounds:YES];
            [lay6 setCornerRadius:3.0];//值越大，角度越圆
        }
    }
    else
    {
        self.resultGroupObjectImageView.image = self.image;
        self.resultGroupObjectImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.resultGroupObjectImageView.clipsToBounds = YES;
        
        
        CALayer *lay  = self.resultGroupObjectImageView.layer;//获取ImageView的层
        [lay setMasksToBounds:YES];
        [lay setCornerRadius:3.0];//值越大，角度越圆
    
    NSURL *url1 = [NSURL URLWithString:[[self.result objectAtIndex:0] url]];
    NSData *data1= [[NSData alloc] initWithContentsOfURL:url1];
    self.resultGroupImageView1.image = [[UIImage alloc] initWithData:data1];
    
    CALayer *lay1  = self.resultGroupImageView1.layer;//获取ImageView的层
    [lay1 setMasksToBounds:YES];
    [lay1 setCornerRadius:3.0];//值越大，角度越圆
    
    
    NSURL *url2 = [NSURL URLWithString:[[self.result objectAtIndex:1] url]];
    NSData *data2= [[NSData alloc] initWithContentsOfURL:url2];
    self.resultGroupImageView2.image = [[UIImage alloc] initWithData:data2];
    
    CALayer *lay2  = self.resultGroupImageView2.layer;//获取ImageView的层
    [lay2 setMasksToBounds:YES];
    [lay2 setCornerRadius:3.0];//值越大，角度越圆
    
    NSURL *url3 = [NSURL URLWithString:[[self.result objectAtIndex:2] url]];
    NSData *data3= [[NSData alloc] initWithContentsOfURL:url3];
    self.resultGroupImageView3.image = [[UIImage alloc] initWithData:data3];

    CALayer *lay3  = self.resultGroupImageView3.layer;//获取ImageView的层
    [lay3 setMasksToBounds:YES];
    [lay3 setCornerRadius:3.0];//值越大，角度越圆
    
    NSURL *url4 = [NSURL URLWithString:[[self.result objectAtIndex:3] url]];
    NSData *data4= [[NSData alloc] initWithContentsOfURL:url4];
    self.resultGroupImageView4.image = [[UIImage alloc] initWithData:data4];
    
    CALayer *lay4  = self.resultGroupImageView1.layer;//获取ImageView的层
    [lay4 setMasksToBounds:YES];
    [lay4 setCornerRadius:3.0];//值越大，角度越圆
    
    NSURL *url5 = [NSURL URLWithString:[[self.result objectAtIndex:4] url]];
    NSData *data5= [[NSData alloc] initWithContentsOfURL:url5];
    self.resultGroupImageView5.image = [[UIImage alloc] initWithData:data5];
    
    CALayer *lay5  = self.resultGroupImageView2.layer;//获取ImageView的层
    [lay5 setMasksToBounds:YES];
    [lay5 setCornerRadius:3.0];//值越大，角度越圆
    
    NSURL *url6 = [NSURL URLWithString:[[self.result objectAtIndex:5] url]];
    NSData *data6= [[NSData alloc] initWithContentsOfURL:url6];
    self.resultGroupImageView6.image = [[UIImage alloc] initWithData:data6];
    
    CALayer *lay6  = self.resultGroupImageView3.layer;//获取ImageView的层
    [lay6 setMasksToBounds:YES];
    [lay6 setCornerRadius:3.0];//值越大，角度越圆
    }
    NSLog(@"The url is %@",self.inputImageUrl);
    
}

-(IBAction)toggleNav:(id)sender{
    
    BOOL hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
}

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

- (IBAction)button1:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IndividualResult *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"IndividualResult"];
    second.image = [self.result objectAtIndex:0];
    second.result = self.result;
    second.inputImage = self.image;
    second.inputImageUrl = self.inputImageUrl;
    [self presentViewController:second animated:YES completion:nil];
}

- (IBAction)button2:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IndividualResult *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"IndividualResult"];
    second.image = [self.result objectAtIndex:1];
    second.result = self.result;
    second.inputImage = self.image;
    second.inputImageUrl = self.inputImageUrl;
    [self presentViewController:second animated:YES completion:nil];
}

- (IBAction)button3:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IndividualResult *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"IndividualResult"];
    second.image = [self.result objectAtIndex:2];
    second.result = self.result;
    second.inputImage = self.image;
    second.inputImageUrl = self.inputImageUrl;
    [self presentViewController:second animated:YES completion:nil];
}

- (IBAction)button4:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IndividualResult *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"IndividualResult"];
    second.image = [self.result objectAtIndex:3];
    second.inputImage = self.image;
    second.inputImageUrl = self.inputImageUrl;
    [self presentViewController:second animated:YES completion:nil];
}

- (IBAction)button5:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IndividualResult *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"IndividualResult"];
    second.image = [self.result objectAtIndex:4];
    second.result = self.result;
    second.inputImage = self.image;
    second.inputImageUrl = self.inputImageUrl;
    [self presentViewController:second animated:YES completion:nil];
}

- (IBAction)button6:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IndividualResult *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"IndividualResult"];
    second.image = [self.result objectAtIndex:5];
    second.result = self.result;
    second.inputImage = self.image;
    second.inputImageUrl = self.inputImageUrl;
    [self presentViewController:second animated:YES completion:nil];
}
@end
