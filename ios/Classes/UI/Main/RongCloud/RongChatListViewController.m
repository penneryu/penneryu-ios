//
//  RongChatListViewController.m
//  ios
//
//  Created by sh587 on 15/10/29.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "RongChatListViewController.h"

@interface RongChatListViewController ()

@end

@implementation RongChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"会话";

    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION)]];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"单聊"
                                                                   style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(rightBarButtonItemPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.conversationListTableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)rightBarButtonItemPressed:(id)sender {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = @"2";
    conversationVC.userName = @"PengYu";
    conversationVC.title = @"PengYu";
    [self.navigationController pushViewController:conversationVC animated:YES];
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.userName = model.conversationTitle;
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
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
