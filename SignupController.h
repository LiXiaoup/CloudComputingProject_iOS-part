//
//  LoginController4.h
//  ADVFlatUI
//
//  Created by Tope on 30/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLoginController.h"

@interface SignupController : BaseLoginController

@property (nonatomic, weak) IBOutlet UITextField * usernameField;

@property (nonatomic, weak) IBOutlet UITextField * passwordField;
@property (weak, nonatomic) IBOutlet UITextField *repeatpassField;

@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (nonatomic, weak) IBOutlet UIView * infoView;

@property (nonatomic, weak) IBOutlet UILabel * infoLabel;
- (IBAction)ButtonSignup:(id)sender;

@end
