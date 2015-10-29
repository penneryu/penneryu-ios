//
//  RongLoginViewController.m
//  ios
//
//  Created by sh587 on 15/10/29.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "RongLoginViewController.h"
#import "RongIMKit/RCConversationViewController.h"
#import "RongChatListViewController.h"
#import "SVProgressHUD.h"

@interface RongLoginViewController ()

@end

@implementation RongLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    
    CGFloat width = self.view.bounds.size.width - 20;
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame = CGRectMake(10, 20, width, 50);
    loginButton.layer.borderWidth = 1;
    loginButton.layer.borderColor = [UIColor grayColor].CGColor;
    [loginButton setTitle:@"登录融云" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginRongCloud:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loginOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginOutBtn.frame = CGRectMake(10, 80, width, 50);
    loginOutBtn.layer.borderWidth = 1;
    loginOutBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [loginOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [loginOutBtn addTarget:self action:@selector(loginOutRongCloud:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    [self.view addSubview:loginOutBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loginRongCloud:(id)sender {
    //登录融云服务器,开始阶段可以先从融云API调试网站获取，之后token需要通过服务器到融云服务器取。
    NSString *token = @"Fe5CLfSipGjBCwhwTwaG/EW6ywf1ANSZ81B7h1DcEkPdc5FwVguEIwkGcKg+xlxkihI2v1xCxoOlxEoyRJL/Kw==";
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        [[RCIM sharedRCIM] setUserInfoDataSource:self];   //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
        NSLog(@"Login successfully with userId: %@.", userId);
        dispatch_async(dispatch_get_main_queue(), ^{
            RongChatListViewController *chatListViewController = [[RongChatListViewController alloc]init];
            [self.navigationController pushViewController:chatListViewController animated:YES];
        });
    } error:^(RCConnectErrorCode status) {
        NSLog(@"login error status: %ld.", (long)status);
    } tokenIncorrect:^{
        NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
    }];
}

- (void)loginOutRongCloud:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要退出登录吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[RCIM sharedRCIM]disconnect];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion {
    if ([@"1" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1";
        user.name = @"PennerYu";
        user.portraitUri = @"";
        return completion(user);
    } else if([@"2" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"2";
        user.name = @"PengYu";
        user.portraitUri = @"";
        return completion(user);
    }
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
