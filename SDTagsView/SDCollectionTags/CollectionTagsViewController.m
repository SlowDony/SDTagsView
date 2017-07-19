//
//  CollectionTagsViewController.m
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "CollectionTagsViewController.h"
#import "SDHeader.h"
#import "SDTagsView.h"
#import "TagsModel.h"
@interface CollectionTagsViewController ()

@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation CollectionTagsViewController

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
    
    SDTagsView *sdTagsView =[SDTagsView sdTagsViewWithTagsArr:self.dataArr];
    sdTagsView.frame =CGRectMake(0,0,mDeviceWidth,300);
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
