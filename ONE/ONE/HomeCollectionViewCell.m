//
//  HomeCollectionViewCell.m
//  ONE
//
//  Created by hlznj on 2016/12/26.
//  Copyright © 2016年 hlznj. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *bomView;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation HomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _scrollview = [[UIScrollView alloc] init];
        _scrollview.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _scrollview.contentSize = CGSizeMake(frame.size.width, frame.size.height*2);
        _scrollview.backgroundColor = kHRGB(0XFFFFFF);
        _scrollview.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_scrollview];
        
        _scrollview.delegate = self;
        
        UIView *contentView = [[UIView alloc] init];
        [_scrollview addSubview:contentView];
        
        _bgView = [[UIView alloc] init];
        _bgView.layer.borderWidth = 2;
        _bgView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 8;
        [contentView addSubview:_bgView];
        
        self.imageView = [[UIImageView alloc] init];
        [_bgView addSubview:self.imageView];
        
        self.hpNumLabel = [[UILabel alloc] init];
        self.hpNumLabel.font = [UIFont systemFontOfSize:10];
        self.hpNumLabel.textColor = kHRGB(0X999999);
        [_bgView addSubview:self.hpNumLabel];
        
        self.hpLabel = [[UILabel alloc] init];
        self.hpLabel.font = [UIFont systemFontOfSize:10];
        self.hpLabel.textColor = kHRGB(0X999999);
        [_bgView addSubview:self.hpLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:10];
        self.timeLabel.textColor = kHRGB(0X999999);
        [_bgView addSubview:self.timeLabel];
        
        self.desLabel = [[UILabel alloc] init];
        self.desLabel.numberOfLines = 0;
        [_bgView addSubview:self.desLabel];
        
        self.desLabel.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
        [self.desLabel addGestureRecognizer:longP];
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(self.timeLabel.mas_bottom).offset(10);
        }];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.left.mas_equalTo(10);
            make.height.mas_equalTo(frame.size.width * 2.0 / 3.0);
        }];
        
        [self.hpNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
            make.left.mas_equalTo(10);
        }];
        
        [self.hpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.hpNumLabel);
            make.right.mas_equalTo(-10);
        }];
        
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.hpNumLabel.mas_bottom).offset(12);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.desLabel.mas_bottom).offset(10);
            make.right.mas_equalTo(-10);
        }];
        
        [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_scrollview);
            make.width.mas_equalTo(_scrollview);
            make.height.mas_equalTo(_scrollview).offset(200);
        }];
        
        self.bomView = [[UIView alloc] init];
        [self.contentView addSubview:self.bomView];
        
        [self.bomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(frame.size.width, 60));
            make.bottom.mas_equalTo(-10);
        }];
        
        UIButton *xiaoji = [[UIButton alloc] init];
        [xiaoji setImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
        [xiaoji setTitle:@"小记" forState:UIControlStateNormal];
        xiaoji.titleLabel.font = [UIFont systemFontOfSize:12];
        [xiaoji setTitleColor:kHRGB(0X999999) forState:UIControlStateNormal];
        xiaoji.imageEdgeInsets = UIEdgeInsetsMake(10, -5, 10, 5);
        xiaoji.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        [_bomView addSubview:xiaoji];
        
        [xiaoji mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 40));
            make.centerY.mas_equalTo(0);
        }];
        
        UIButton *fenxiang = [[UIButton alloc] init];
        [fenxiang setImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
        [_bomView addSubview:fenxiang];
        [fenxiang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.centerY.mas_equalTo(0);
        }];
        
        self.loveButton = [[UIButton alloc] init];
        [self.loveButton setImage:[UIImage imageNamed:@"aixin"] forState:UIControlStateNormal];
        self.loveButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.loveButton setTitleColor:kHRGB(0X999999) forState:UIControlStateNormal];;
        self.loveButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
        self.loveButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        [_bomView addSubview:self.loveButton];
        
        [self.loveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(fenxiang.mas_left).offset(-10);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(80, 40));
        }];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat bomY = scrollView.frame.size.height - self.bgView.frame.size.height - 20 + scrollView.contentOffset.y;
    if (bomY > 80) {
        [self.bomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
        }];
    }
    else
    {
        [self.bomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(70 - bomY);
        }];
    }
}

- (void)fillDataWithModel:(HomeModel *)model
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.hp_img_original_url]];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:model.hp_content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];
    [paragraphStyle setParagraphSpacing:3];
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, model.hp_content.length)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, model.hp_content.length)];
    self.desLabel.attributedText = attStr;
    
    self.hpNumLabel.text = model.hp_title;
    self.hpLabel.text = model.hp_author;
    self.timeLabel.text = model.hp_makettime;

    [self.loveButton setTitle:model.praisenum forState:UIControlStateNormal];

    //bomView初始位置
    CGFloat desTextH = [attStr boundingRectWithSize:CGSizeMake(self.frame.size.width - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.height;
    CGFloat hpH = [UIFont systemFontOfSize:10].lineHeight;
    CGFloat num = self.frame.size.width * 2.0 / 3.0 + desTextH + hpH*2 + 72;
    
     CGFloat bomY = self.frame.size.height - num;
    
    if (bomY > 80) {
        [self.bomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
        }];
    }
    else
    {
        [self.bomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(70 - bomY);
        }];
    }
}

//长按文字复制到粘贴板
- (void)longP:(UIGestureRecognizer *)ges
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.desLabel.text;
    UIWindow *windows = [UIApplication sharedApplication].keyWindow;
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    tipLabel.text = @"已将内容复制到剪切板";
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.layer.masksToBounds = YES;
    tipLabel.layer.cornerRadius = 8;
    tipLabel.alpha = 0;
    [windows addSubview:tipLabel];
    
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(180, 50));
        make.center.mas_equalTo(0);
    }];
    
    [UIView animateWithDuration:0.2 animations:^{
        tipLabel.alpha = 1;
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                tipLabel.alpha = 0.f;
            } completion:^(BOOL finished) {
                [tipLabel removeFromSuperview];
            }];
            
        });
    
    }];
    
}

@end
