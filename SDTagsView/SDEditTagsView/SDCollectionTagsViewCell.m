//
//  SDCollectionTagsViewCell.m
//  SDTagsView
//
//  Created by slowdony on 2017/9/9.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDCollectionTagsViewCell.h"


#import "SDHelper.h"
#import "TagsModel.h"
@implementation SDCollectionTagsViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
    UILabel *title = [[UILabel alloc] init];
    
    title.font = [UIFont systemFontOfSize:16];
    title.layer.cornerRadius = 2.0;
    title.layer.masksToBounds = YES;
    title.layer.borderWidth = 1.0;
    title.textAlignment = NSTextAlignmentCenter;
    
    self.title = title;
    [self.contentView addSubview:title];
}

-(void)setValueWithModel:(TagsModel *)model{
    
    self.title.text = [NSString stringWithFormat:@"%@",model.title];
    self.title.frame = CGRectMake(0, 10, ([SDHelper widthForLabel:model.title fontSize:16] + 10), 22);
    self.title.textColor = [SDHelper getColor:model.color];
    self.title.layer.borderColor = [SDHelper getColor:model.color].CGColor;
}

@end
