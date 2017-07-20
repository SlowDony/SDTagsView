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
#define SDtagsHeadView @"SDtagsHeadView"

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
        //注册头部
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SDtagsHeadView];
        
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
    return CGSizeMake(width+10,32);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SDtagsView forIndexPath:indexPath];
    
    NSArray *arr =self.dataArr[indexPath.section];
    TagsModel *model =arr[indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",model.title];
    label.frame = CGRectMake(0, 10, ([SDHelper widthForLabel:label.text fontSize:16] + 10), 22);
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
    
    if ([self.sd_delegate respondsToSelector:@selector(SDCollectionTagsView:didSelectItemAtIndexPath:)]){
        [self.sd_delegate SDCollectionTagsView:self didSelectItemAtIndexPath:indexPath];
    }
    
    SDLog(@"index:%@",model.title);
}

//头部试图大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(mDeviceWidth, 30);
}
//头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headView =(UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SDtagsHeadView forIndexPath:indexPath];
    UILabel *label =[[UILabel  alloc]init];
    label.frame =CGRectMake(0, 0, mDeviceWidth, 30);
    if (indexPath.section==0){
        label.text =@"我的标签";
    }
    else {
         label.text =@"所有标签";
    }
    
    label.textColor =[UIColor blackColor];
    
    UIView *line =[[UIView alloc]init];
    line.backgroundColor =borderCol;
    line.frame =CGRectMake(0, 30, mDeviceWidth, 0.5);
    [headView addSubview:line];
    [headView addSubview:label];
    return headView;
}

@end
