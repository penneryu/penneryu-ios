//
//  PYWelcomeViewController.m
//  ios
//
//  Created by sh587 on 15/11/2.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "PYWelcomeViewController.h"
#import "PYTabBarController.h"

#define PYWelcomeItemCount 3

@interface PYWelcomeViewController () <UIScrollViewDelegate> {
    UIPageControl *pageControl;
}

@end

@implementation PYWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupScrollView];
    [self setupPageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    CGFloat width = scrollView.bounds.size.width;
    CGFloat height = scrollView.bounds.size.height;
    for (int i = 0; i < PYWelcomeItemCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *name = [NSString stringWithFormat:@"new_feature%d", i+1];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * width, 0, width, height);
        [scrollView addSubview:imageView];
        
        if (i == PYWelcomeItemCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    scrollView.contentSize = CGSizeMake(PYWelcomeItemCount * width, 0);
    scrollView.backgroundColor = PYColor(246, 246, 246);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

- (void)setupPageControl {
    pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = PYWelcomeItemCount;
    pageControl.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height - 30);
    [self.view addSubview:pageControl];
    pageControl.currentPageIndicatorTintColor = PYColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = PYColor(189, 189, 189);
}

- (void)setupLastImageView:(UIImageView *)imageView {
    imageView.userInteractionEnabled = YES;
    
    UIButton * startButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    startButton.backgroundColor = [UIColor redColor];
    startButton.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.8);
    [imageView addSubview:startButton];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark-UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    double doublePage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    int intPage = (int)(doublePage + 0.5);
    pageControl.currentPage = intPage;
}

- (void)start {
    PYTabBarController *controller = [[PYTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = controller;
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
