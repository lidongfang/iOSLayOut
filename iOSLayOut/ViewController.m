//
//  ViewController.m
//  iOSLayOut
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 HKTX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *layOutTableViewDataSource;
@property (nonatomic,strong)NSMutableArray *controllers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"布局";
    self.layOutTableViewDataSource=[NSMutableArray arrayWithObjects:@"iOS 原始绝对布局",@"iOS之自动布局Autoresizing",@"iOS之自动布局Autolayout",@"开源类库的布局方式",@"关于iPhone屏幕尺寸大小，布局自动缩放比例", nil];
    self.controllers=[NSMutableArray arrayWithObjects:@"absoluteLayoutController",@"autoresizingLayoutController",@"autoLayoutController",@"source3rdController",@"percentLayoutController", nil];
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    [tableView reloadData];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.layOutTableViewDataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *indentiferStr=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indentiferStr];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentiferStr];
    }
    cell.detailTextLabel.text=self.layOutTableViewDataSource[indexPath.row];
    cell.detailTextLabel.adjustsFontSizeToFitWidth=YES;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *Vc=[[NSClassFromString(self.controllers[indexPath.row]) alloc]init];
    Vc.title=self.layOutTableViewDataSource[indexPath.row];
    [self.navigationController pushViewController:Vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
