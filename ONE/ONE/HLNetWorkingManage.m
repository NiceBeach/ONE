//
//  HLNetWorkingManage.m
//  ONE
//
//  Created by hlznj on 2016/12/26.
//  Copyright © 2016年 hlznj. All rights reserved.
//

#import "HLNetWorkingManage.h"

@implementation HLNetWorkingManage

+ (void)homeRequestWithData:(NetBlock)netBlock
{
    NSString *url = @"http://v3.wufazhuce.com:8000/api/hp/more/0?version=v3.5.3&platform=ios&user_id=";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        netBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
}

+ (void)readBannerRequestWithData:(NetBlock)netBlock
{
    NSString *url = @"http://v3.wufazhuce.com:8000/api/reading/carousel?version=v3.5.3&platform=ios&user_id=";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        netBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
}

//阅读banner
//http://v3.wufazhuce.com:8000/api/reading/carousel?version=v3.5.3&platform=ios&user_id=

//阅读
//http://v3.wufazhuce.com:8000/api/reading/index?version=v3.5.3&platform=ios&user_id=

@end
