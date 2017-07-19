//
//  LabelTagsViewController.m
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "LabelTagsViewController.h"
#import "SDHeader.h"
#import "SDLabTagsView.h"
#import "TagsModel.h"
@interface LabelTagsViewController ()

/**
 数据源
 */
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation LabelTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:self.navTitle];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setUp];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)dataArr{
    if (!_dataArr){
        NSString *path =[[NSBundle mainBundle ]pathForResource:@"tagsData.plist" ofType:nil];
        NSArray *dataArr =[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArr =[NSMutableArray array];
        for (NSDictionary *dict in dataArr){
            TagsModel *model =[[TagsModel alloc]initWithTagsDict:dict];
            [tempArr addObject:model];
        }
        _dataArr =[tempArr copy];
    }
    return _dataArr;
}
-(void)setUp{
    
    SDLabTagsView *sdTagsView =[SDLabTagsView sdLabTagsViewWithTagsArr:self.dataArr];
    sdTagsView.frame =CGRectMake(0,30,mDeviceWidth,300);
    [self.view addSubview:sdTagsView];
    
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
