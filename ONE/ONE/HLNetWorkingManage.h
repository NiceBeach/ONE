//
//  HLNetWorkingManage.h
//  ONE
//
//  Created by hlznj on 2016/12/26.
//  Copyright © 2016年 hlznj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetBlock)(id data);

@interface HLNetWorkingManage : NSObject

//首页
+ (void)homeRequestWithData:(NetBlock)netBlock;

//阅读banner
+ (void)readBannerRequestWithData:(NetBlock)netBlock;

@end
