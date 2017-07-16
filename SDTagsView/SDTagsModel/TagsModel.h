//
//  TagsModel.h
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagsModel : NSObject
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *color;
-(instancetype )initWithTagsDict:(NSDictionary *)dict;
@end
