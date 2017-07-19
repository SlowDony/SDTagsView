//
//  SDCollectionTagsView.m
//  SDTagsView
//
//  Created by slowdony on 2017/7/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDCollectionTagsView.h"
#import "TagsModel.h"
#import "SDHelper.h" 
#import "SDHeader.h"
#define SDtagsView @"SDtagsView"

@interface SDCollectionTagsView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@end
@implementation SDCollectionTagsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        //注册
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:SDtagsView];
        
    }
    return self;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arr =self.dataArr[section];
    
    return arr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *arr =self.dataArr[indexPath.section];
    TagsModel *model =arr[indexPath.row];
    CGFloat width = [SDHelper widthForLabel:[NSString stringWithFormat:@"%@",model.title] fontSize:16];
    return CGSizeMake(width+10,22);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SDtagsView forIndexPath:indexPath];
    
    NSArray *arr =self.dataArr[indexPath.section];
    TagsModel *model =arr[indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",model.title];
    label.frame = CGRectMake(0, 0, ([SDHelper widthForLabel:label.text fontSize:16] + 10), 22);
    label.font = [UIFont systemFontOfSize:16];
    label.layer.cornerRadius = 2.0;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 1.0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [SDHelper getColor:model.color];
    label.layer.borderColor = [SDHelper getColor:model.color].CGColor;
    [cell.contentView addSubview:label];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr =self.dataArr[indexPath.section];
    TagsModel *model =arr[indexPath.row];
    SDLog(@"index:%@",model.title);
}


@end
