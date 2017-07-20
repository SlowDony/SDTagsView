//
//  SDEditTagsViewController.m
//  SDTagsView
//
//  Created by slowdony on 2017/7/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDEditTagsViewController.h"
#import "TagsModel.h"
#import "SDCollectionTagsView.h"

#import "SDHeader.h"

@interface SDEditTagsViewController ()
<SDCollectionTagsViewDelegate>

/**
 我的标签数据
 */
@property (nonatomic,strong)NSMutableArray *myTagsArr;

/**
 更多标签数据
 */
@property (nonatomic,strong)NSMutableArray *moreTagsArr;

/**
 所有标签数据
 */
@property (nonatomic,strong)NSMutableArray *dataArr;


/**
 SDCollectionTagsView
 */
@property (nonatomic,strong)SDCollectionTagsView *tagsView;

@end

@implementation SDEditTagsViewController



-(NSMutableArray *)myTagsArr{
    if (!_myTagsArr) {
        _myTagsArr =[NSMutableArray array];
        
    }
    return _myTagsArr;
}

-(NSMutableArray *)moreTagsArr{
    if (!_moreTagsArr){
       
        NSString *path =[[NSBundle mainBundle]pathForResource:@"tagsData" ofType:@"plist"];
        NSArray *arr =[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *emptyArr =[NSMutableArray array];
        for (NSDictionary *dic in arr) {
            TagsModel *tagsModel =[TagsModel tagsModelWithDict:dic];
            [emptyArr addObject:tagsModel];
        }
         _moreTagsArr =[NSMutableArray arrayWithArray:emptyArr];
        
        
    }
    return _moreTagsArr;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr){
        _dataArr =[NSMutableArray array];
    
    }
    return _dataArr;
}


-(SDCollectionTagsView *)tagsView{
    if (!_tagsView){
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        
        _tagsView =[[SDCollectionTagsView alloc]initWithFrame:CGRectMake(15, 10, mDeviceWidth-30, mDeviceHeight) collectionViewLayout:flowLayout];
        _tagsView.sd_delegate =self;
    }
    return _tagsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =self.navTitle;
    self.view.backgroundColor =[UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tagsView];
    
    [self.dataArr addObject:self.myTagsArr];
    [self.dataArr addObject:self.moreTagsArr];
    self.tagsView.dataArr =[NSMutableArray arrayWithArray:self.dataArr];
    [self.tagsView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SDCollectionTagsViewDelegate

-(void)SDCollectionTagsView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TagsModel *tagsModel;
    if (indexPath.section ==0) //我的标签
    {
        tagsModel = self.myTagsArr[indexPath.row];
        [self.myTagsArr removeObjectAtIndex:indexPath.row];
        [self.moreTagsArr insertObject:tagsModel atIndex:0];
        
        [self.tagsView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForItem:0 inSection:1]];
        [self.dataArr addObject:self.myTagsArr];
        [self.dataArr addObject:self.moreTagsArr];
        [self.tagsView reloadData];
        
    }
    
    if (indexPath.section ==1) //所有标签
    {
        tagsModel =self.moreTagsArr[indexPath.row];
        [self.moreTagsArr removeObjectAtIndex:indexPath.row];
        [self.myTagsArr insertObject:tagsModel atIndex:0];

        [self.tagsView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        
        [self.dataArr addObject:self.myTagsArr];
        [self.dataArr addObject:self.moreTagsArr];
        [self.tagsView reloadData];

    }
    
    
    
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
