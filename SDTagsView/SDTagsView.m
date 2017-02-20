//
//  SDTagsView.m
//  SDTagsView
//
//  Created by apple on 2017/2/20.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDTagsView.h"
#import "SDHeader.h"

#define SDRectangleTagMaxCoult 3 // 矩阵标签时，最多列数
@interface SDTagsView ()
{
    UIView *sdTagsView;
    NSArray *tagsArr;
}
@end
@implementation SDTagsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUP];
    }
    return self;
}

-(void)setUP{
    // 创建标签容器
    sdTagsView = [[UIView alloc] init];
    sdTagsView.frame  = CGRectMake(0, 0, mDeviceWidth, 300);
    
    sdTagsView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:sdTagsView];
    
    tagsArr =@[@"哈哈哈",@"哦哦哦哦哦哦",@"耶耶耶",@"哦",@"啦啦"];
    
   
    for (int i = 0; i < tagsArr.count; i++) {
        
        CGFloat rectangleTagLabelWith =sdTagsView.frame.size.width / SDRectangleTagMaxCoult;
        ;
        
        CGFloat rectangleTagLabelHeight =40;
        CGFloat rectangleTagLabelX =rectangleTagLabelWith* (i % SDRectangleTagMaxCoult);
        CGFloat rectangleTagLabelY =rectangleTagLabelHeight * (i / SDRectangleTagMaxCoult);
        // 创建标签
        UILabel *rectangleTagLabel = [self labelWithTitle: tagsArr[i]];
        
        // 设置属性
       
        
//        rectangleTagLabel.textAlignment = NSTextAlignmentCenter;
        [rectangleTagLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagDidCLick:)]];
        
        
        // 添加标签
        [sdTagsView addSubview:rectangleTagLabel];
    }

}

- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.userInteractionEnabled = YES;
    label.font = [UIFont systemFontOfSize:12];
    label.text = title;
    label.textColor = [UIColor grayColor];
    label.backgroundColor = [UIColor redColor];
    label.layer.cornerRadius = 3;
    label.clipsToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    
    NSLog(@"py_width:%f,py_height:%f",label.frame.size.width ,label.frame.size.height);
    return label;
}
-(void)tagDidCLick:(UITapGestureRecognizer *)gr{
    
    UILabel *label = (UILabel *)gr.view;
    
    
}
@end
