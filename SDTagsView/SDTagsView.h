//
//  SDTagsView.h
//  SDTagsView
//
//  Created by apple on 2017/2/20.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDTagsView : UIView
@property (nonatomic,strong)NSArray *tagsArr;
+(instancetype)sdTagsViewWithTagsArr:(NSArray*)tagsArr;
@end
