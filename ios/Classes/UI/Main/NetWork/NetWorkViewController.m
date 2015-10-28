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
    
    httpFactory = [[ChannelHttpFactory alloc]init];
    __weak NetWorkViewController *weakSelf = self;
    [httpFactory setHttpHandler:^(id responseObject) {
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
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
