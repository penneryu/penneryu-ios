//
//  PYTabBarController.m
//  ios
//
//  Created by sh587 on 15/10/12.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "PYTabBarController.h"
#import "PYNaviationController.h"
#import "MainViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"

@interface PYTabBarController ()

@end

@implementation PYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *mainViewController = [[MainViewController alloc]init];
    [self addViewController:mainViewController title:@"首页" imageName:@"ic_personal" selectedImageName:nil];
    
    MessageViewController *messageViewController = [[MessageViewController alloc]init];
    [self addViewController:messageViewController title:@"消息" imageName:@"ic_personal" selectedImageName:nil];
    
    DiscoverViewController *discoverViewController = [[DiscoverViewController alloc]init];
    [self addViewController:discoverViewController title:@"发现" imageName:@"ic_personal" selectedImageName:nil];
    
    ProfileViewController *profileViewController = [[ProfileViewController alloc]init];
    [self addViewController:profileViewController title:@"我的" imageName:@"ic_personal" selectedImageName:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addViewController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName
        selectedImageName:(NSString *)selectImageName {
    controller.title = title;
    if (imageName != nil) {
        controller.tabBarItem.image = [UIImage imageNamed:imageName];
    }
    if (selectImageName != nil) {
        controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    }
    
    PYNaviationController *navationController = [[PYNaviationController alloc]initWithRootViewController:controller];
    [self addChildViewController:navationController];
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
