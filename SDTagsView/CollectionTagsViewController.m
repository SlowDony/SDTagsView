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
@interface CollectionTagsViewController ()
{
    NSArray *tagsArr;
}
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
-(void)setUp{
    
    tagsArr= @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB",@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    
    SDTagsView *sdTagsView =[SDTagsView sdTagsViewWithTagsArr:tagsArr];
    
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
