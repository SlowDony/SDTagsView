//
//  SDTagsView.m
//  SDTagsView
//
//  Created by apple on 2017/2/20.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDTagsView.h"
#import "SDHeader.h"
#import "TagsModel.h"
#define SDRectangleTagMaxCoult 3 // 矩阵标签时，最多列数
@interface SDTagsView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIView *sdTagsView;
    
}
@property (nonatomic,strong)UICollectionView *collectionView;

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
  
    [sdTagsView addSubview:self.collectionView];
}

+(instancetype)sdTagsViewWithTagsArr:(NSArray*)tagsArr{
    SDTagsView *sdTagsView =[[SDTagsView alloc]init];
    sdTagsView.tagsArr =[[NSArray alloc]initWithArray:tagsArr];
    return sdTagsView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
//        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 64, mDeviceWidth-30, mDeviceHeight-100) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        [sdTagsView addSubview:_collectionView];
        //注册
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"SDtagsView"];
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
    CGFloat width = [self widthForLabel:[NSString stringWithFormat:@"%@",model.title] fontSize:16];
    return CGSizeMake(width+10,22);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SDtagsView" forIndexPath:indexPath];
    TagsModel *model =self.tagsArr[indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",model.title];
    label.frame = CGRectMake(0, 0, ([self widthForLabel:label.text fontSize:16] + 10), 22);
    label.font = [UIFont systemFontOfSize:16];
    label.layer.cornerRadius = 2.0;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 1.0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [self getColor:model.color];
    label.layer.borderColor = [self getColor:model.color].CGColor;
    [cell.contentView addSubview:label];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagsModel *model =self.tagsArr[indexPath.row];
    NSLog(@"index:%@",model.color);
}

/**
 *  计算文字长度
 */
- (CGFloat)widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
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
