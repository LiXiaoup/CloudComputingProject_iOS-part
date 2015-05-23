//
//  ProfileController1.m
//  ADVFlatUI
//
//  Created by Tope on 31/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "ProfileController.h"
#import <QuartzCore/QuartzCore.h>
#include "dbUser.h"
#include "SingleSample.h"

@interface ProfileController ()

@end

@implementation ProfileController

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
    
    if([SingleSample sharedSingleSample].username)
    {
        NSLog(@"the username is %@",[SingleSample sharedSingleSample].username);
    }
    
    dbUser *user = [dbUser getUserInfo:[SingleSample sharedSingleSample].username];

	
    UIColor* mainColor = [UIColor colorWithRed:242.0/255 green:117.0/255 blue:151.0/255 alpha:1.0f];
    
    NSString* fontName = @"GillSans-Italic";
    NSString* boldFontName = @"GillSans-Bold";
    
    self.nameLabel.textColor =  [UIColor whiteColor];
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:18.0f];
    self.nameLabel.text = user.username;
    
    self.locationLabel.textColor =  [UIColor whiteColor];
    self.locationLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.locationLabel.text = user.email;
    
    UIFont* countLabelFont = [UIFont fontWithName:boldFontName size:20.0f];
    self.brandCountLabel.textColor =  mainColor;
    self.brandCountLabel.font =  countLabelFont;
    self.brandCountLabel.text = @"21";
    
    self.friendsCountLabel.textColor =  mainColor;
    self.friendsCountLabel.font =  countLabelFont;
    self.friendsCountLabel.text = @"100";
    
    self.searchCountLabel.textColor =  mainColor;
    self.searchCountLabel.font =  countLabelFont;
    self.searchCountLabel.text = @"66";
    
    
    UIFont* socialFont = [UIFont fontWithName:boldFontName size:7.0f];
    UIColor* socialColor = [UIColor lightGrayColor];
    
    self.brandLabel.textColor =  socialColor;
    self.brandLabel.font =  socialFont;
    self.brandLabel.text = @"BRANDS in LOVE";
    
    self.friendsLabel.textColor =  socialColor;
    self.friendsLabel.font =  socialFont;
    self.friendsLabel.text = @"FRIENDS";
    
    self.searchLabel.textColor =  socialColor;
    self.searchLabel.font =  socialFont;
    self.searchLabel.text = @"SEARCHES";
    
    
    UIFont* labelFont = [UIFont fontWithName:boldFontName size:14.0f];
    
    self.joinedLabel.textColor =  mainColor;
    self.joinedLabel.font =  labelFont;
    self.joinedLabel.text = @"Joined";
    
    self.bioLabel.textColor =  mainColor;
    self.bioLabel.font =  labelFont;
    self.bioLabel.text = @"Bio";
    
    self.friendLabel.textColor =  mainColor;
    self.friendLabel.font =  labelFont;
    self.friendLabel.text = @"Friends";
    
    UIFont* valueFont = [UIFont fontWithName:fontName size:14.0f];
    
    self.joinedValueLabel.textColor =  mainColor;
    self.joinedValueLabel.font =  valueFont;
    self.joinedValueLabel.text = user.start_time;
    
    self.bioValueLabel.textColor =  mainColor;
    self.bioValueLabel.font =  valueFont;
    self.bioValueLabel.text = user.bio;
    
    
    self.profileBgImageView.image = [UIImage imageNamed:@"pink_bg12.gif"];
    self.profileBgImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 48.0f;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.countContainer.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0f];
    
    self.joinedContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.joinedContainer.layer.borderWidth = 1.0f;
    
    self.bioContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.bioContainer.layer.borderWidth = 1.0f;
    
    self.friendContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.friendContainer.layer.borderWidth = 1.0f;
    
    UIColor* imageBorderColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:0.4f];
    
    [self styleFriendProfileImage:self.friendImageView1 withImageNamed:@"profile-1.jpg" andColor:imageBorderColor];
    [self styleFriendProfileImage:self.friendImageView2 withImageNamed:@"profile-2.jpg" andColor:imageBorderColor];
    [self styleFriendProfileImage:self.friendImageView3 withImageNamed:@"profile-3.jpg" andColor:imageBorderColor];
    
    self.overlay.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.15f];

}

-(IBAction)toggleNav:(id)sender{
    
    BOOL hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
}

-(void)styleFriendProfileImage:(UIImageView*)imageView withImageNamed:(NSString*)imageName andColor:(UIColor*)color{
    
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
