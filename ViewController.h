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
@property NSMutableArray *history;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong) UITableView* feedTableView;
- (IBAction)imagePick:(id)sender;

@end
