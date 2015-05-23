//
//  ViewController.h
//  igridviewdemo
//
//  Created by vincent_guo on 13-12-12.
//  Copyright (c) 2013年 vincent_guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (IBAction)Camera:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonCamera;

@property (weak, nonatomic) IBOutlet UIView *headerView;
- (IBAction)imagePick:(id)sender;

@end
