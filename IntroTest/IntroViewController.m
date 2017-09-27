//
//  IntroViewController.m
//  IntroTest
//
//  Created by Masao S on 2017/09/27.
//  Copyright © 2017年 miil. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger pageSize = 5;

    // prepare scrollView
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].applicationFrame);
    
    _scrollView = [[UIScrollView alloc] initWithFrame:(CGRect) {
        .origin = 0, 80,
        .size = width, width
    }];
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = true;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(pageSize * width, 0);
    
    for (int i = 0; i < pageSize; i++) {
        // TODO: Y座標の指定がどうしてこうなるか
        UIView *view = [[UIView alloc] initWithFrame:(CGRect) {
            .origin = i * width, -64,
            .size = width, width
        }];
        if (i % 2 == 1) {
            view.backgroundColor = [UIColor blueColor];
        } else {
            view.backgroundColor = [UIColor greenColor];
        }
        [_scrollView addSubview:view];
        
    }
    [self.view addSubview:_scrollView];
    
    
    // prepare pageControl
    CGFloat pageControlWidth = 100;
    CGFloat pageControlHeight = 22;
    _pageControl = [[UIPageControl alloc] initWithFrame:(CGRect) {
        .origin = (width - pageControlWidth) / 2, CGRectGetMaxY(_scrollView.frame) - 44,
        .size = pageControlWidth, pageControlHeight
    }];
    _pageControl.numberOfPages = pageSize;
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_pageControl];
}

# pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (fmod(scrollView.contentOffset.x, CGRectGetMaxX(scrollView.frame)) == 0) {
        _pageControl.currentPage = (int)(scrollView.contentOffset.x / CGRectGetMaxX(scrollView.frame));
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
