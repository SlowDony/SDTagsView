//
//  SDCollectionTagsView.h
//  SDTagsView
//
//  Created by slowdony on 2017/7/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SDCollectionTagsViewDelegate <NSObject>

- (void)SDCollectionTagsView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface SDCollectionTagsView : UICollectionView




/**
 数据源
 */
@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,weak) id<SDCollectionTagsViewDelegate>sd_delegate;
@end
