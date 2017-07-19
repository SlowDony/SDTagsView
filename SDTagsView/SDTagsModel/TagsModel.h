//
//  TagsModel.h
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagsModel : NSObject

/**
 标签标题
 */
@property (nonatomic,strong)NSString *title;

/**
 标签颜色
 */
@property (nonatomic,strong)NSString *color;

-(instancetype )initWithTagsDict:(NSDictionary *)dict;
+(instancetype)tagsModelWithDict:(NSDictionary *)dict;
@end
