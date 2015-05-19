//
//  IndividualResult.m
//  SearchResult
//
//  Created by 宛丁 黎 on 5/9/15.
//  Copyright (c) 2015 Wanding Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndividualResult.h"

@interface IndividualResult ()

@end

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
    
    UIColor* mainColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:0.2f];
    
    NSString* fontName = @"GillSans-Italic";
    NSString* boldFontName = @"GillSans-Bold";
    
    self.individualResultButtonView.tintColor =  [UIColor whiteColor];
    
    self.individualResultBrandView.backgroundColor = mainColor;
    self.individualResultPriceView.backgroundColor = mainColor;
    
    
    //    UIFont* countLabelFont = [UIFont fontWithName:boldFontName size:20.0f];
    //    self.brandCountLabel.textColor =  mainColor;
    //    self.brandCountLabel.font =  countLabelFont;
    //    self.brandCountLabel.text = @"21";
    
    //    UIFont* socialFont = [UIFont fontWithName:boldFontName size:7.0f];
    //    UIColor* socialColor = [UIColor lightGrayColor];
    
    //    self.brandLabel.textColor =  socialColor;
    //    self.brandLabel.font =  socialFont;
    //    self.brandLabel.text = @"BRANDS in LOVE";
    
    //    UIFont* labelFont = [UIFont fontWithName:boldFontName size:14.0f];
    
    //    self.joinedLabel.textColor =  mainColor;
    //    self.joinedLabel.font =  labelFont;
    //    self.joinedLabel.text = @"Joined";
    
    //    UIFont* valueFont = [UIFont fontWithName:fontName size:14.0f];
    
    //    self.joinedValueLabel.textColor =  mainColor;
    //    self.joinedValueLabel.font =  valueFont;
    //    self.joinedValueLabel.text = @"1 Year Ago";
    //self.resultGroupBgImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 600)];
    self.individualResultBgImageView.image = [UIImage imageNamed:@"pink_bg2.jpg"];
    
    self.individualResultImageView.image = [UIImage imageNamed:@"1.jpg"];
    self.individualResultImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.individualResultImageView.clipsToBounds = YES;
    //self.profileImageView.layer.cornerRadius = 48.0f;
    //self.resultGroupObjectImageView.layer.borderWidth = 4.0f;
    //self.resultGroupObjectImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.individualResultBrandView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
    //self.resultGroupTitleView.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    //self.resultGroupTitleView.layer.borderWidth = 1.0f;
    
    UIColor* imageBorderColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:0.4f];
    
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
