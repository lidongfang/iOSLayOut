//
//  autoresizingLayoutController.m
//  iOSLayOut
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 HKTX. All rights reserved.
//

#import "autoresizingLayoutController.h"
#define kTopSpace 64
#define kMargin 20

#define kTopViewHeight 44
#define kTopViewWidth 300

#define kTextLabelWidth 200
#define kTextLabelHeight 30
@interface autoresizingLayoutController ()

@end

@implementation autoresizingLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //autosizingLayout  是4s之后开始有使用的，也就是ios6之后出现的
    // 以Iphone4（320， 480）为基础，设置各控件的位置
    // 注意：必须所有控件都按照Iphone4（320， 480）为基础初始化一次，不然按比例缩放时会发生错误！
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(kMargin, kTopSpace, kTopViewWidth, kTopViewHeight)];
    CGFloat textLabelTop = (topView.frame.size.width - kTextLabelWidth) / 2;
    CGFloat textLabelWidth = (topView.frame.size.height - kTextLabelHeight) / 2;
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabelTop, textLabelWidth, kTextLabelWidth, kTextLabelHeight)];
    textLabel.backgroundColor=[UIColor blackColor];
    // 设置文字及居中
    [textLabel setText:@"Garvey"];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    
    // 分别设置样式
    [topView setBackgroundColor:[UIColor redColor]];
    [textLabel setTextColor:[UIColor whiteColor]];
    
    // 设置文字控件的宽度按照上一级视图（topView）的比例进行缩放
    [textLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    // 设置View控件的宽度按照父视图的比例进行缩放，距离父视图顶部、左边距和右边距的距离不变
    [topView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin];
    
    // 添加视图
    [topView addSubview:textLabel];
    [self.view addSubview:topView];
    
    // 注意：重新设置topView位置的代码，必须要写在添加视图的后面，不然autoresizing的位置计算会出错！
    CGFloat topViewWidth = self.view.frame.size.width - kMargin * 2;
    [topView setFrame:CGRectMake(kMargin, kTopSpace, topViewWidth, kTopViewHeight)];
   
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
