//
//  SDTagsView.m
//  SDTagsView
//
//  Created by apple on 2017/2/20.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDTagsView.h"

#import "SDCollectionTagsViewCell.h"
#import "SDHeader.h"
#import "SDHelper.h"
#import "TagsModel.h"
#define SDRectangleTagMaxCoult 3 // 矩阵标签时，最多列数

#define SDtagsView @"SDtagsView"
@interface SDTagsView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>


@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)UIView *sdTagsView;
@end
@implementation SDTagsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)sdTagsViewWithTagsArr:(NSArray*)tagsArr{
    SDTagsView *sdTagsView =[[SDTagsView alloc]init];
    sdTagsView.tagsArr =[[NSArray alloc]initWithArray:tagsArr];
    return sdTagsView;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUP];
    }
    return self;
}

-(void)setUP{
    
    [self addSubview:self.collectionView];
}



- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 20, mDeviceWidth-30, mDeviceHeight-44) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;

       [_collectionView setBackgroundColor:[UIColor clearColor]];
        //注册
       [_collectionView registerClass:[SDCollectionTagsViewCell class] forCellWithReuseIdentifier:SDtagsView];
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tagsArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TagsModel *model =self.tagsArr[indexPath.row];
    CGFloat width = [SDHelper widthForLabel:[NSString stringWithFormat:@"%@",model.title] fontSize:16];
    return CGSizeMake(width+10,22);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDCollectionTagsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SDtagsView forIndexPath:indexPath];
    TagsModel *model =self.tagsArr[indexPath.row];
    
    [cell setValueWithModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagsModel *model =self.tagsArr[indexPath.row];
    SDLog(@"index:%@",model.title);
}

@end
