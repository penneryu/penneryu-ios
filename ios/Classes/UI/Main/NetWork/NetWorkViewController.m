//
//  NetWorkViewController.m
//  ios
//
//  Created by sh587 on 15/10/28.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "NetWorkViewController.h"
#import "ChannelHttpFactory.h"
#import "ChannelInfo.h"
#import "SVProgressHUD.h"
#import "AsyncImageView.h"

@interface NetWorkViewController () {
    ChannelHttpFactory *httpFactory;
}

@end

@implementation NetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.resultLabel];
    
    AsyncImageView * imageView = [[AsyncImageView alloc]initWithFrame:CGRectMake(0, 80, 300, 200)];
    [imageView setImageURL:@"http://img.vision.pptv.com/images/1c/f8/1cf8b6806829e5ffcd958f2da5f436ba7e936e55.jpeg"];
    [self.view addSubview:imageView];
    
    httpFactory = [[ChannelHttpFactory alloc]init];
    __weak NetWorkViewController *weakSelf = self;
    [httpFactory setHttpHandler:^(id responseObject) {
        [SVProgressHUD dismiss];
        NetWorkViewController *strongSelf = weakSelf;
        if (strongSelf != nil) {
             NSArray *array = (NSArray *)responseObject;
            for (ChannelInfo *channelInfo in array) {
                strongSelf.resultLabel.text = [NSString stringWithFormat:@"%@ %@", strongSelf.resultLabel.text == nil ? @"" : strongSelf.resultLabel.text , channelInfo.name];
            }
        }
    } faliure:^{
        [SVProgressHUD dismiss];
        NSLog(@"channel factory fali");
    }];
    [httpFactory downloadDatas:nil];
    [SVProgressHUD show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
