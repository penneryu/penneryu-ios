//
//  MessageViewController.m
//  ios
//
//  Created by sh587 on 15/10/12.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:nil];
    [segmentedControl insertSegmentWithTitle:@"收件箱"atIndex:0 animated:NO];
    [segmentedControl insertSegmentWithTitle:@"已发送"atIndex:1 animated:NO];
    [segmentedControl addTarget:self action:@selector(segmentedPressed:)
               forControlEvents:UIControlEventValueChanged];
    segmentedControl.center = CGPointMake(self.view.bounds.size.width / 2, segmentedControl.frame.size.height / 2);
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl setTintColor:[UIColor whiteColor]];
    
    UIView *parentView = [[UIView alloc]init];
    parentView.backgroundColor = PYOrangeColor;
    parentView.frame = CGRectMake(0, 0, self.view.bounds.size.width, segmentedControl.frame.size.height + 6);
    [parentView addSubview:segmentedControl];
    [self.view addSubview:parentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)segmentedPressed:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    long index = control.selectedSegmentIndex;
    if (index == 0) {
        
    } else if (index == 1) {
        
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
