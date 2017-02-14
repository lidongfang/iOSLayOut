//
//  absoluteLayoutController.m
//  iOSLayOut
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 HKTX. All rights reserved.
//

#import "absoluteLayoutController.h"

@interface absoluteLayoutController ()

@end

@implementation absoluteLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //绝对布局这种方式只是在4s之前使用
    UIView *singleView=[[UIView alloc]initWithFrame:CGRectMake(10,20+64, 100, 30)];
    singleView.backgroundColor=[UIColor redColor];
    [self.view addSubview:singleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
