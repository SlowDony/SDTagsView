//
//  SDCollectionTagsViewCell.h
//  SDTagsView
//
//  Created by slowdony on 2017/9/9.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TagsModel;
@interface SDCollectionTagsViewCell : UICollectionViewCell
//标签
@property (nonatomic,strong)UILabel *title;
-(void)setValueWithModel:(TagsModel *)model;
@end
