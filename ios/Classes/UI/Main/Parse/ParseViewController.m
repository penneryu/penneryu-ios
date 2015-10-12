//
//  ParseViewController.m
//  ios
//
//  Created by sh587 on 15/10/10.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "ParseViewController.h"
#import "Parse/Parse.h"
#import "SVProgressHUD.h"

@interface ParseViewController ()

@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@end

@implementation ParseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Parse";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)singinBtnDidPress:(id)sender {
    NSString *userName = self.userNameTextField.text;
    NSString *passWord = self.passwordTextField.text;
    
    if ([userName length] > 0 && [passWord length] > 0) {
        [SVProgressHUD show];
        [PFUser logInWithUsernameInBackground:userName password:passWord block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            if (user) {
                [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            } else {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }
        }];
    } else {
        [SVProgressHUD showInfoWithStatus:@"用户名和密码不能为空"];
    }
}

@end
