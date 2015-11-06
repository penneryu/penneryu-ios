//
//  ProfileViewController.m
//  ios
//
//  Created by sh587 on 15/10/12.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController () {
    UIActivityIndicatorView *indicator;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self showIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showIndicator {
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:
                                          UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.view.bounds.size.width / 2, indicator.frame.size.height);
    [indicator setColor:[UIColor grayColor]];
    [indicator setHidesWhenStopped:YES];
    [self.view addSubview:indicator];
    
    [indicator startAnimating];
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
