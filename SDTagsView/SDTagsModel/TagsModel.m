//
//  TagsModel.m
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "TagsModel.h"

@implementation TagsModel

-(instancetype )initWithTagsDict:(NSDictionary *)dict{
    self =[super init];
    if(self ){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)tagsModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithTagsDict:dict];
}
@end
