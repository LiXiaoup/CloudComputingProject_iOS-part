//
//  IndividualResult.h
//  SearchResult
//
//  Created by 宛丁 黎 on 5/9/15.
//  Copyright (c) 2015 Wanding Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbImage.h"

@interface IndividualResult : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView* individualResultBgImageView;
@property (nonatomic, weak) IBOutlet UIImageView* individualResultImageView;

@property (nonatomic, weak) IBOutlet UIButton* individualResultLikeButton;
@property (nonatomic, weak) IBOutlet UIButton* individualResultShopButton;

@property (nonatomic, weak) IBOutlet UIView* individualResultButtonView;
@property (nonatomic, weak) IBOutlet UIView* individualResultBrandView;
@property (nonatomic, weak) IBOutlet UIView* individualResultPriceView;
@property (nonatomic, weak) IBOutlet UIView* individualResultBgView;

@property (nonatomic, weak) IBOutlet UILabel* individualResultBrandLabel;
@property (nonatomic, weak) IBOutlet UILabel* individualResultDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel* individualResultPriceLabel;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property dbImage *image;
@property NSMutableArray *result;
@property UIImage *inputImage;
@property NSString *inputImageUrl;
- (IBAction)shopButton:(id)sender;
- (IBAction)likeButton:(id)sender;

- (IBAction)backButton:(id)sender;
@end