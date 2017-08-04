//
//  HomeCollectionViewCell.h
//  ONE
//
//  Created by hlznj on 2016/12/26.
//  Copyright © 2016年 hlznj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *desLabel;

@property (nonatomic, strong) UILabel *hpNumLabel;

@property (nonatomic, strong) UILabel *hpLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *loveButton;

- (void)fillDataWithModel:(HomeModel *)model;

@end
