//
//  SDLabTagsView.m
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDLabTagsView.h"
#import "SDHeader.h"
#import "TagsModel.h"
@interface SDLabTagsView ()
{
    UIView *sdTagsView;
}
@property (nonatomic,strong)UILabel *tagsLab;
@end
@implementation SDLabTagsView

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
    sdTagsView.frame  = CGRectMake(0, 64, mDeviceWidth, 300);
    
    sdTagsView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:sdTagsView];
}

+(instancetype)sdLabTagsViewWithTagsArr:(NSArray *)tagsArr{
    SDLabTagsView *sdLabTagsView =[[SDLabTagsView alloc]init];
    sdLabTagsView.tagsArr =tagsArr;
    [sdLabTagsView setUItags:tagsArr];
    return sdLabTagsView;
}

-(void)setUItags:(NSArray *)arr{
    
    int width = 10;
    
    int j = 0;
    
    int row = 1;
    
    
    for (int i = 0 ; i < arr.count; i++) {
        
        TagsModel *model =arr[i];

        int labWidth = [self widthForLabel:model.title fontSize:16]+10;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(5*j + width, row * 30, labWidth, 22);
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.text =model.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.numberOfLines = 1;
        label.layer.borderWidth = 1;
        label.textColor = [self getColor:model.color];
        label.layer.borderColor = [self getColor:model.color].CGColor;
        
        


        [sdTagsView addSubview:label];
        
        width = width + labWidth;
        
        j++;
        
        if (width > mDeviceWidth - 50) {
            
            j = 0;
            
            width = 10;
            
            row++;
            
            label.frame = CGRectMake(5*j + width,row * 30, labWidth, 22);
            
            width = width + labWidth;
            
            j++;
            
        }
        
    }
    
}


/*
 计算字体的宽度
 */
-(CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat )fontSize{
    CGSize size =[text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize],NSFontAttributeName, nil]];
    
    return size.width;
}

-(UIColor *) getColor:(NSString *)hexColor
{
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}
@end
