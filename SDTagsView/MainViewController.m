//
//  MainViewController.m
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

/*
 
 github地址https://github.com/SlowDony/SDTagsView
 
 标签使我们日常项目开发中经常遇见的,SDTagsView两种布局方式
 
 .UILabel
 .UICollectionView (推荐使用)
 
 目前支持展示标签,自适应标签宽度.
 点击新增标签,删除标签
 
 我的邮箱：devslowdony@gmail.com
 
 如果有好的建议或者意见 ,欢迎指出 , 您的支持是对我最大的鼓励,谢谢. 求STAR ..😆
 */


#import "MainViewController.h"
#import "SDHeader.h"
#import "CollectionTagsViewController.h"
#import "LabelTagsViewController.h"
#import "SDEditTagsViewController.h"
@interface MainViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>


@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title=@"标签列表";
    self.view.backgroundColor=bjColor;
    [self setui];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
       NSArray * arr=@[@[@"利用collectionView布局tagsView",@"利用label布局tagsView"],@[@"编辑tagsView"]];
        _dataArr =[NSMutableArray arrayWithArray:arr];

        
    }
    return _dataArr;
}

-(void)setui{
    
        //
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mDeviceWidth, mDeviceHeight) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
}
#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr =self.dataArr[section];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //配置数据
    NSArray *arr =self.dataArr[indexPath.section];
    cell.textLabel.text =arr[indexPath.row];
    return cell;
}


#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *arr =self.dataArr[indexPath.section];
    if (indexPath.section==0){
        switch (indexPath.row) {
            case 0:
            {
                CollectionTagsViewController *v =[[CollectionTagsViewController alloc]init];
                v.navTitle =arr[indexPath.row];
                [self.navigationController pushViewController:v animated:YES];
            }
                break;
            case 1:
            {
                LabelTagsViewController *v =[[LabelTagsViewController alloc]init];
                v.navTitle =arr[indexPath.row];
                [self.navigationController pushViewController:v animated:YES];
            }
                break;
                
            default:
                break;

        }
    }else {
        SDEditTagsViewController *v =[[SDEditTagsViewController alloc]init];
        v.navTitle =arr[indexPath.row];
        [self.navigationController pushViewController:v animated:YES];
     }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
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
