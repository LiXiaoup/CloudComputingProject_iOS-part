//
//  LoginController4.m
//  ADVFlatUI
//
//  Created by Tope on 30/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "LoginController.h"
#import <QuartzCore/QuartzCore.h>
#import "RootViewController.h"
#import "SingleSample.h"

static NSString* const kBaseURL = @"http://160.39.196.65:8081/";
static NSString* const kLogin = @"login";

@interface LoginController ()

@end

@implementation LoginController

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
	
    UIColor* mainColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:213.0/255 green:62.0/255 blue:116.0/255 alpha:1.0f];
    
    //mainColor:252 172 204
    //darkColor:244 42 110
    //mainColor:246 207 226
    //darkColor:225 59 107
    NSString* fontName = @"Avenir-Book";
    NSString* boldFontName = @"Avenir-Black";
    
    self.view.backgroundColor = mainColor;
    
    self.usernameField.backgroundColor = [UIColor whiteColor];
    self.usernameField.placeholder = @"Email Address";
    self.usernameField.font = [UIFont fontWithName:fontName size:16.0f];
    self.usernameField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.usernameField.layer.borderWidth = 1.0f;
    
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 41, 20)];
    self.usernameField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameField.leftView = leftView;
    
    
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.placeholder = @"Password";
    self.passwordField.font = [UIFont fontWithName:fontName size:16.0f];
    self.passwordField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.passwordField.layer.borderWidth = 1.0f;
    
    
    UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 41, 20)];
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordField.leftView = leftView2;
    
    self.loginButton.backgroundColor = darkColor;
    self.loginButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    self.forgotButton.backgroundColor = [UIColor clearColor];
    self.forgotButton.titleLabel.font = [UIFont fontWithName:fontName size:12.0f];
    [self.forgotButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:darkColor forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    
   
    self.titleLabel.textColor =  [UIColor whiteColor];
    self.titleLabel.font =  [UIFont fontWithName:boldFontName size:24.0f];
    self.titleLabel.text = @"WELCOME!";
    
    self.infoLabel.textColor =  [UIColor darkGrayColor];
    self.infoLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    self.infoLabel.text = @"please login below";
    
    self.infoView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    self.headerImageView.image = [UIImage imageNamed:@"pink_bg12.gif"];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.overlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.3f];
    
    [self.forgotButton addTarget:self action:@selector(toggleNav:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(IBAction)toggleNav:(id)sender{
    
    BOOL hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonLogin:(id)sender {
    
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kLogin]]; //1
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //3
    
    
    NSString* queryString = [NSString stringWithFormat:@"{\"username\":\"%@\",\"password\":\"%@\"}",self.usernameField.text,self.passwordField.text];
    NSLog(@"%@",queryString);
    
    NSData* data = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            //NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            
            NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSString* msg = responseDict[@"msg"];
            NSLog(@"%@",msg);
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                if ([msg isEqual: @"login success"]) {
                    //single sample
                    [SingleSample sharedSingleSample].username = self.usernameField.text;
                    
                    //先获取UIStoryBoard对象，参数为文件名
                    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    //获取SecondViewController实例，参数是StoryBoard ID,选中View Controller,在Identity Inspector中
                    RootViewController *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"rootController"];
                    //设置过渡的样式，和显示的样式
                    //second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                    //显示
                    [self presentViewController:second animated:YES completion:nil];
                }
                else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed!"
                                                                    message:[NSString stringWithFormat: @"%@ ",msg]
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                }
            }];
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    
    [dataTask resume]; //8
}

@end
