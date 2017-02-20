//
//  ViewController.m
//  SDTagsView
//
//  Created by apple on 2017/2/20.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "ViewController.h"

#import "SDHeader.h"
#import "SDTagsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUp{
    SDTagsView *sdTagsView =[[SDTagsView alloc]init];
    
    sdTagsView.frame =CGRectMake(0,30,mDeviceWidth, 300);

    [self.view addSubview:sdTagsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
