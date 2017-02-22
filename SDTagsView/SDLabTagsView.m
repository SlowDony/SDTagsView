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

        int labWidth = [self widthForLabel:model.title fontSize:12]+10;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(5*j + width, row * 30, labWidth, 15);
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.text =model.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        label.numberOfLines = 1;
        label.layer.borderWidth = 1;
        [sdTagsView addSubview:label];
        
        width = width + labWidth;
        
        j++;
        
        if (width > mDeviceWidth - 50) {
            
            j = 0;
            
            width = 10;
            
            row++;
            
            label.frame = CGRectMake(5*j + width,row * 30, labWidth, 15);
            
            width = width + labWidth;
            
            j++;
            
        }
        
        int z = i%4;
        
        switch (z) {
            case 0:
            {
                label.textColor = mHexRGB(0xeb3027);
                label.layer.borderColor = mHexRGB(0xeb3027).CGColor;
            }
                break;
            case 1:
            {
                label.textColor = mHexRGB(0x22b6ff);
                label.layer.borderColor = mHexRGB(0x22b6ff).CGColor;
            }
                break;
            case 2:
            {
                label.textColor = mHexRGB(0x51b20a);
                label.layer.borderColor = mHexRGB(0x51b20a).CGColor;
            }
                break;
            case 3:
            {
                label.textColor = mHexRGB(0x897be2);
                label.layer.borderColor = mHexRGB(0x897be2).CGColor;
            }
                break;
            case 4:
            {
                label.textColor = mHexRGB(0xeb3027);
                label.layer.borderColor = mHexRGB(0xeb3027).CGColor;
            }
                break;
                
            default:
                break;
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

@end
