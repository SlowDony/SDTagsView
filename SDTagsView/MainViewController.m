//
//  MainViewController.m
//  SDTagsView
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "MainViewController.h"
#import "SDHeader.h"
#import "CollectionTagsViewController.h"
#import "LabelTagsViewController.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataArr;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title=@"标签列表";
    [self setui];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setui{
    
    dataArr=@[@"利用collectionView布局tagsView",@"利用label布局tagsView"];
    //
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mDeviceWidth, mDeviceHeight) style:UITableViewStylePlain];
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
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        //        cell = [[[NSBundle mainBundle] loadNibNamed:@"<#string#>" owner:self options:nil]lastObject];
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //配置数据
    cell.textLabel.text =dataArr[indexPath.row];
    return cell;
}


#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            CollectionTagsViewController *v =[[CollectionTagsViewController alloc]init];
            v.navTitle =dataArr[indexPath.row];
            [self.navigationController pushViewController:v animated:YES];
        }
            break;
        case 1:
        {
            LabelTagsViewController *v =[[LabelTagsViewController alloc]init];
              v.navTitle =dataArr[indexPath.row];
            [self.navigationController pushViewController:v animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
