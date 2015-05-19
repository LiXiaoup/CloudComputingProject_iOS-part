//
//  ProfileController1.h
//  ADVFlatUI
//
//  Created by Tope on 31/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileController : UIViewController


@property (nonatomic, weak) IBOutlet UIImageView* profileBgImageView;

@property (nonatomic, weak) IBOutlet UIImageView* profileImageView;

@property (weak, nonatomic) IBOutlet UIView *overlay;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView1;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView2;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView3;

@property (nonatomic, weak) IBOutlet UILabel* nameLabel;

@property (nonatomic, weak) IBOutlet UILabel* locationLabel;

@property (nonatomic, weak) IBOutlet UILabel* brandLabel;

@property (nonatomic, weak) IBOutlet UILabel* friendsLabel;

@property (nonatomic, weak) IBOutlet UILabel* searchLabel;

@property (nonatomic, weak) IBOutlet UILabel* brandCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* friendsCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* searchCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* joinedLabel;

@property (nonatomic, weak) IBOutlet UILabel* joinedValueLabel;

@property (nonatomic, weak) IBOutlet UILabel* bioLabel;

@property (nonatomic, weak) IBOutlet UILabel* bioValueLabel;

@property (nonatomic, weak) IBOutlet UILabel* friendLabel;

@property (nonatomic, weak) IBOutlet UIView* joinedContainer;

@property (nonatomic, weak) IBOutlet UIView* bioContainer;

@property (nonatomic, weak) IBOutlet UIView* friendContainer;

@property (nonatomic, weak) IBOutlet UIView* countContainer;



@end
