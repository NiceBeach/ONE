//
//  HomeModel.h
//  ONE
//
//  Created by hlznj on 2016/12/26.
//  Copyright © 2016年 hlznj. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HomeModel <NSObject>@end
@interface HomeModel : JSONModel

@property(nonatomic, strong)NSString <Optional>* content_bgcolor;
@property(nonatomic, strong)NSString <Optional>* hp_author;
@property(nonatomic, strong)NSString <Optional>* hp_content;
@property(nonatomic, strong)NSString <Optional>* hp_img_original_url;
@property(nonatomic, strong)NSString <Optional>* hp_title;
@property(nonatomic, strong)NSString <Optional>* hp_makettime;
@property(nonatomic, strong)NSString <Optional>* hpcontent_id;
@property(nonatomic, strong)NSString <Optional>* image_authors;
@property(nonatomic, strong)NSString <Optional>* image_from;
@property(nonatomic, strong)NSString <Optional>* last_update_date;
@property(nonatomic, strong)NSString <Optional>* praisenum;

@end


@protocol HomeDataModel <NSObject>@end
@interface HomeDataModel : JSONModel

@property (nonatomic, strong) NSArray <Optional,HomeModel>*data;

@end
