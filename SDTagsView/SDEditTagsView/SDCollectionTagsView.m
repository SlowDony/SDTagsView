//
//  SDCollectionTagsView.m
//  SDTagsView
//
//  Created by slowdony on 2017/7/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDCollectionTagsView.h"

#import "SDCollectionTagsViewCell.h"

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

/**
 存放cell唯一标识符
 */
@property (nonatomic,strong)NSMutableDictionary *cellIdDic;

@end
@implementation SDCollectionTagsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSMutableDictionary *)cellIdDic{
    if (!_cellIdDic){
        _cellIdDic =[NSMutableDictionary dictionary];
    }
    return _cellIdDic;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        //注册
        [self registerClass:[SDCollectionTagsViewCell class] forCellWithReuseIdentifier:SDtagsView];
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
    //每次从字典中取出根据IndexPath取出唯一标识符
    
    SDCollectionTagsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SDtagsView forIndexPath:indexPath];
    
    NSArray *arr =self.dataArr[indexPath.section];
    TagsModel *model =arr[indexPath.row];
    
    [cell setValueWithModel:model];
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
    UILabel *titlelabel =[[UILabel  alloc]init];
    titlelabel.frame =CGRectMake(20, 0, 100, 30);
    titlelabel.textColor =fontHightColor;

    UILabel *detaillabel =[[UILabel  alloc]init];
    detaillabel.frame =CGRectMake(100, 0, mDeviceWidth-100, 30);
    detaillabel.textColor =fontNomalColor;
    detaillabel.font =[UIFont systemFontOfSize:12];
    titlelabel.textColor =fontHightColor;
    if (indexPath.section==0){
        titlelabel.text =@"我的标签";
        detaillabel.text =@"(点击我的标签可以移除)";
        
    }
    else if(indexPath.section==1){
         titlelabel.text =@"所有标签";
         detaillabel.text =@"(点击所有标签添加到我的标签)";
    }

    
    //头部view下划线
    UIView *line =[[UIView alloc]init];
    line.backgroundColor =borderCol;
    line.frame =CGRectMake(0, 30, mDeviceWidth, 0.5);
    [headView addSubview:line];
    [headView addSubview:titlelabel];
    [headView addSubview:detaillabel];
    return headView;
}

@end
