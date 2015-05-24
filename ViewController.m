//
//  ViewController.m
//  igridviewdemo
//
//  Created by vincent_guo on 13-12-12.
//  Copyright (c) 2013年 vincent_guo. All rights reserved.
//

#import "ViewController.h"
#import "UITableGridViewCell.h"
#import "UIImageButton.h"
#import "CameraSessionView.h"
#import "ResultGroup.h"
#import "SingleSample.h"
#import "dbImage.h"
#import "ResultGroup.h"
#import "ODRefreshControl.h"
#define kImageWidth  118 //UITableViewCell里面图片的宽度
#define kImageHeight  118 //UITableViewCell里面图片的高度

static NSString* const kBaseURL = @"http://160.39.196.152:3000/";
static NSString* const kSearch = @"files";
static NSString* const kLogin = @"login";
static NSString* const kHistory = @"history";


@interface ViewController ()<CACameraSessionDelegate>

@property (nonatomic, strong) CameraSessionView *cameraView;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImage *image;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    UIColor* mainColor = [UIColor colorWithRed:246.0/255 green:207.0/255 blue:226.0/255 alpha:1.0f];
    
    self.image = [self cutCenterImage:[UIImage imageNamed:@"2.jpg"]  size:CGSizeMake(100, 100)];
    
    CGSize mSize = [[UIScreen mainScreen] bounds].size;
    CGFloat tableHeight = 200;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableHeight, self.view.frame.size.width, self.view.frame.size.height-tableHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    //self.headerImage.image = [UIImage imageNamed:@"pink_bg2.jpg"];
    [self.buttonCamera setBackgroundImage:[UIImage imageNamed:@"search-icon@2x.jpg"] forState:UIControlStateNormal];
    
   // self.headerView.backgroundColor = mainColor;
    self.history = [SingleSample sharedSingleSample].history;
    for(NSString *his in self.history)
    {
        NSLog(@"%@",his);
    }
    ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
}


#pragma mark UITable datasource and delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //may have problem
    return self.history.count/3+1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identifier = @"Cell";

    //自定义UITableGridViewCell，里面加了个NSArray用于放置里面的3个图片按钮
    UITableGridViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableGridViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectedBackgroundView = [[UIView alloc] init];
        NSMutableArray *array = [NSMutableArray array];
        for (int i=0; i<3; i++) {
            NSLog(@"%ld, count is %ld",indexPath.row*3+i,self.history.count/3);            //image url here
            NSURL *url;
            if(indexPath.row*3+i>=self.history.count)
            {
                url =  [NSURL URLWithString:@"http://therandywhite.com/wp-content/uploads/2014/11/white.png"];
            }
            else{
                url = [NSURL URLWithString:[self.history objectAtIndex:indexPath.row*3+i]];
            }
            NSData *data= [[NSData alloc] initWithContentsOfURL:url];
            
            //自定义继续UIButton的UIImageButton 里面只是加了2个row和column属性
            UIImageButton *button = [UIImageButton buttonWithType:UIButtonTypeCustom];
            button.bounds = CGRectMake(0, 0, kImageWidth, kImageHeight);
            button.center = CGPointMake((1 + i) * 5 + kImageWidth *( 0.5 + i) , 5 + kImageHeight * 0.5);
            //button.column = i;
            [button setValue:[NSNumber numberWithInt:i] forKey:@"column"];
            [button addTarget:self action:@selector(imageItemClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [button setBackgroundImage:[[UIImage alloc] initWithData:data] forState:UIControlStateNormal];
            [cell addSubview:button];
            [array addObject:button];
        }
        
        [cell setValue:array forKey:@"buttons"];
    }
    
    //获取到里面的cell里面的3个图片按钮引用
    NSArray *imageButtons =cell.buttons;
    //设置UIImageButton里面的row属性
    [imageButtons setValue:[NSNumber numberWithInt:indexPath.row] forKey:@"row"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kImageHeight + 5;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //不让tableviewcell有选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)imageItemClick:(UIImageButton *)button{
    
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kHistory]]; //1
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //3
    
    
    NSString* queryString = [NSString stringWithFormat:@"{\"base\":\"%@\"}",[self.history objectAtIndex:button.row*3+button.column]];
    NSLog(@"%@",queryString);
    
    NSData* data = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    NSMutableArray* history= [[NSMutableArray alloc] init];
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",myString);
            
            NSMutableArray *result = [[NSMutableArray alloc] init];
         //   NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
         //   NSArray* resultArray = responseDict[@"url"];
            
            NSError *e = nil;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
            for(int i=0;i<jsonArray.count;i++)
            {
                NSDictionary *item =  [jsonArray objectAtIndex:i];
                NSString *url = [item objectForKey:@"url"];
                
                [result addObject:url];
                NSLog(@"%@",url);
            }
            
            while([result count]==0)
            {
                sleep(1);
                NSLog(@"waiting");
            }
            NSLog(@"%ld",result.count);
            for(NSString *re in result)
            {
                NSLog(@"%@",re);
            }

            
            UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //获取SecondViewController实例，参数是StoryBoard ID,选中View Controller,在Identity Inspector中
            ResultGroup *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"ResultGroup"];
            //设置过渡的样式，和显示的样式
            second.result = result;
            second.flag  = @"hey";
            second.inputImageUrl = [self.history objectAtIndex:button.row*3+button.column];
            second.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
         //   second.modalPresentationStyle=UIModalPresentationFormSheet;
            //显示
            [self presentViewController:second animated:YES completion:nil];
              
              
        }
        
    }];
    
    NSLog(@"%ld",[[SingleSample sharedSingleSample].history count]);
    
    [dataTask resume]; //8

    
    
    
    
    
    /*
    NSString *msg = [NSString stringWithFormat:@"第%i行 第%i列",button.row + 1, button.column + 1];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"好的，知道了"
                                          otherButtonTitles:nil, nil];
    [alert show];*/
    
    
    //先获取UIStoryBoard对象，参数为文件名
    
    //
    
    
    
   
}



#pragma mark 根据size截取图片中间矩形区域的图片 这里的size是正方形
-(UIImage *)cutCenterImage:(UIImage *)image size:(CGSize)size{
    CGSize imageSize = image.size;
    CGRect rect;
    //根据图片的大小计算出图片中间矩形区域的位置与大小
    if (imageSize.width > imageSize.height) {
        float leftMargin = (imageSize.width - imageSize.height) * 0.5;
        rect = CGRectMake(leftMargin, 0, imageSize.height, imageSize.height);
    }else{
        float topMargin = (imageSize.height - imageSize.width) * 0.5;
        rect = CGRectMake(0, topMargin, imageSize.width, imageSize.width);
    }
    
    CGImageRef imageRef = image.CGImage;
    //截取中间区域矩形图片
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    
    UIImage *tmp = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    
    UIGraphicsBeginImageContext(size);
    CGRect rectDraw = CGRectMake(0, 0, size.width, size.height);
    [tmp drawInRect:rectDraw];
    // 从当前context中创建一个改变大小后的图片
    tmp = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return tmp;
}
- (IBAction)Camera:(id)sender {
    
    //Set white status bar
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Instantiate the camera view & assign its frame
    _cameraView = [[CameraSessionView alloc] initWithFrame:self.view.frame];
    
    //Set the camera view's delegate and add it as a subview
    _cameraView.delegate = self;
    
    //Apply animation effect to present the camera view
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.6];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [[_cameraView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
    
    [self.view addSubview:_cameraView];
    [self.view bringSubviewToFront:_cameraView];
    
    //____________________________Example Customization____________________________
     [_cameraView setTopBarColor:[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha: 0.64]];
    // [_cameraView hideFlashButton]; //On iPad flash is not present, hence it wont appear.
    // [_cameraView hideCameraToogleButton];
    // [_cameraView hideDismissButton];
}

-(void)didCaptureImage:(UIImage *)image {
    NSLog(@"CAPTURED IMAGE");
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    NSString *name =[dbImage uploadImage:image];
    
    NSLog(@"%@",name);
    NSString *inputImageUrl = [NSString stringWithFormat:@"https://s3-us-west-2.amazonaws.com/cloud.snapscout/%@.png",name];
    //self.imageView.image = image;
    NSMutableArray *result =[dbImage searchImage:image imageName:name];
    while([result count]==0)
    {
        sleep(1);
        NSLog(@"waiting");
    }
    
    //jump to another page
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //获取SecondViewController实例，参数是StoryBoard ID,选中View Controller,在Identity Inspector中
    ResultGroup *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"ResultGroup"];
    //设置过渡的样式，和显示的样式
    //second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //显示
    second.inputImageUrl = inputImageUrl;
    second.result = result;
    second.image = image;
    [self presentViewController:second animated:YES completion:nil];
    
    [self.cameraView removeFromSuperview];
}

-(void)didCaptureImageWithData:(NSData *)imageData {
    NSLog(@"CAPTURED IMAGE DATA");
    //UIImage *image = [[UIImage alloc] initWithData:imageData];
    //UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    //[self.cameraView removeFromSuperview];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    //Show error alert if image could not be saved
    if (error) [[[UIAlertView alloc] initWithTitle:@"Error!" message:@"Image couldn't be saved" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (IBAction)imagePick:(id)sender {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]
                                                 init];
    pickerController.delegate = self;

    [self presentModalViewController:pickerController animated:YES];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo
{
    NSString *name =[dbImage uploadImage:image];

    NSLog(@"%@",name);
    //self.imageView.image = image;
    NSMutableArray *result =[dbImage searchImage:image imageName:name];
    NSString *inputImageUrl = [NSString stringWithFormat:@"https://s3-us-west-2.amazonaws.com/cloud.snapscout/%@.png",name];
    while([result count]==0)
    {
        sleep(1);
        NSLog(@"waiting");
    }
    
    //jump to another page
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //获取SecondViewController实例，参数是StoryBoard ID,选中View Controller,在Identity Inspector中
    ResultGroup *second=[mainStoryBoard instantiateViewControllerWithIdentifier:@"ResultGroup"];
    //设置过渡的样式，和显示的样式
    //second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //显示
    second.result = result;
    second.image = image;
    second.inputImageUrl = inputImageUrl;
    [self dismissModalViewControllerAnimated:YES];
    [self presentViewController:second animated:YES completion:nil];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [refreshControl endRefreshing];
    });
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kLogin]]; //1
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //3
    
    
    NSString* queryString = [NSString stringWithFormat:@"{\"username\":\"hey\",\"password\":\"1\"}"];
    NSLog(@"%@",queryString);
    
    NSData* data = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    NSMutableArray* history= [[NSMutableArray alloc] init];
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration]; //4
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (error == nil) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //NSLog(@"%@",myString);
            
            
            NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSString* msg = responseDict[@"msg"];
            NSArray* historyArray = responseDict[@"history"];
            for(int i=0;i<historyArray.count;i++)
            {
                NSString* test = [[[responseDict objectForKey:@"history"] objectAtIndex:i] objectForKey:@"url"];
                    NSLog(@"%@",test);
                [history addObject:test];
            }
            [SingleSample sharedSingleSample].history = history;
            self.history = history;

        }
     
    }];
    
    NSLog(@"%ld",[[SingleSample sharedSingleSample].history count]);
    
    [dataTask resume]; //8
    sleep(1);
    
    NSLog(@"%@", self.tableView);
    [super viewDidLoad];
    
    [self.tableView reloadData];
    
   // [[self tableView] reloadData];
    NSLog(@"reoload!!!");

}

@end
