//
//  ViewController.m
//  ios
//
//  Created by 余鹏 on 15/10/9.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "MainViewController.h"
#import "ParseViewController.h"
#import "StackViewController.h"
#import "NetWorkViewController.h"
#import "RongLoginViewController.h"
#import "WKWebViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)items {
    if (_items) return _items;
    
    _items = @[@"Parse", @"StackView", @"NetWork", @"RongCloud", @"WKWebView", @""];
    
    return _items;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    NSString *title = self.items[indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc;
    if (indexPath.row == 0) {
        vc = [[ParseViewController alloc]initWithNibName:@"ParseViewController" bundle:nil];
    } else if (indexPath.row == 1) {
        vc = [[StackViewController alloc]initWithNibName:@"StackViewController" bundle:nil];
    } else if (indexPath.row == 2) {
        vc = [[NetWorkViewController alloc]init];
    } else if (indexPath.row == 3) {
        vc = [[RongLoginViewController alloc]init];
    } else if (indexPath.row == 4) {
        vc = [[WKWebViewController alloc]init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
