//
//  ResultGroup.h
//  SearchResult
//
//  Created by 宛丁 黎 on 5/9/15.
//  Copyright (c) 2015 Wanding Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultGroup : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView* resultGroupBgImageView;
@property (nonatomic, weak) IBOutlet UIView* resultGroupTitleView;
@property (nonatomic, weak) IBOutlet UIImageView* resultGroupObjectImageView;
@property (nonatomic, weak) IBOutlet UIImageView* resultGroupImageView1;
@property (nonatomic, weak) IBOutlet UIImageView* resultGroupImageView2;
@property (nonatomic, weak) IBOutlet UIImageView* resultGroupImageView3;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *resultGroupImageView4;
@property (weak, nonatomic) IBOutlet UIImageView *resultGroupImageView5;
@property (weak, nonatomic) IBOutlet UIImageView *resultGroupImageView6;

@end

