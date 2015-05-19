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
    
    
    
    self.resultGroupObjectImageView.image = [UIImage imageNamed:@"1.jpg"];
    self.resultGroupObjectImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.resultGroupObjectImageView.clipsToBounds = YES;
    
    
    CALayer *lay  = self.resultGroupObjectImageView.layer;//获取ImageView的层
    [lay setMasksToBounds:YES];
    [lay setCornerRadius:3.0];//值越大，角度越圆 
    
    self.resultGroupTitleView.backgroundColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
    self.bottomView.backgroundColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
        
    self.resultGroupImageView1.image = [UIImage imageNamed:@"2.jpg"];
    
    CALayer *lay1  = self.resultGroupImageView1.layer;//获取ImageView的层
    [lay1 setMasksToBounds:YES];
    [lay1 setCornerRadius:3.0];//值越大，角度越圆
    
    self.resultGroupImageView2.image = [UIImage imageNamed:@"3.jpg"];
    
    CALayer *lay2  = self.resultGroupImageView2.layer;//获取ImageView的层
    [lay2 setMasksToBounds:YES];
    [lay2 setCornerRadius:3.0];//值越大，角度越圆
    
    self.resultGroupImageView3.image = [UIImage imageNamed:@"4.jpg"];

    CALayer *lay3  = self.resultGroupImageView3.layer;//获取ImageView的层
    [lay3 setMasksToBounds:YES];
    [lay3 setCornerRadius:3.0];//值越大，角度越圆
    
    self.resultGroupImageView4.image = [UIImage imageNamed:@"5.jpg"];
    
    CALayer *lay4  = self.resultGroupImageView1.layer;//获取ImageView的层
    [lay4 setMasksToBounds:YES];
    [lay4 setCornerRadius:3.0];//值越大，角度越圆
    
    self.resultGroupImageView5.image = [UIImage imageNamed:@"6.jpg"];
    
    CALayer *lay5  = self.resultGroupImageView2.layer;//获取ImageView的层
    [lay5 setMasksToBounds:YES];
    [lay5 setCornerRadius:3.0];//值越大，角度越圆
    
    self.resultGroupImageView6.image = [UIImage imageNamed:@"7.jpg"];
    
    CALayer *lay6  = self.resultGroupImageView3.layer;//获取ImageView的层
    [lay6 setMasksToBounds:YES];
    [lay6 setCornerRadius:3.0];//值越大，角度越圆
    
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

@end
