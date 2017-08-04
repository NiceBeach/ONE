//
//  HomeViewController.m
//  ONE
//
//  Created by hlznj on 2016/12/26.
//  Copyright © 2016年 hlznj. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeModel.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collection;
@property (nonatomic, strong) HomeDataModel *dataModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleLabel.text = @"ONE";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    self.navigationItem.titleView = titleLabel;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height-64) collectionViewLayout:layout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.view addSubview:self.collection];

    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.showsHorizontalScrollIndicator = NO;
    self.collection.pagingEnabled = YES;
    
    [self.collection registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCollectionViewCell"];

    __weak typeof(self) weakSelf = self;
    [HLNetWorkingManage homeRequestWithData:^(id data) {
        weakSelf.dataModel = [[HomeDataModel alloc] initWithDictionary:data error:nil];
        [weakSelf.collection reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataModel ? self.dataModel.data.count : 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    
    [cell fillDataWithModel:_dataModel.data[indexPath.row]];
    
    return cell;
}


@end
