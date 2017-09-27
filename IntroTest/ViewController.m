//
//  ViewController.m
//  IntroTest
//
//  Created by Masao S on 2017/09/27.
//  Copyright © 2017年 miil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageControl.backgroundColor = [UIColor lightGrayColor];
    _pageControl.numberOfPages = 5;
    _pageControl.userInteractionEnabled = NO;
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
}


# pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row % 2 == 1) {
        cell.backgroundColor = [UIColor greenColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}

# pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    _pageControl.currentPage = indexPath.row;
}

# pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].applicationFrame);
    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
