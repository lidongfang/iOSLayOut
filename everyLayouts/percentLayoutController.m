//
//  percentLayoutController.m
//  iOSLayOut
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 HKTX. All rights reserved.
//

#import "percentLayoutController.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface percentLayoutController ()

@end

@implementation percentLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *singleView=[[UIView alloc]initWithFrame:CGRectMake1(10,20+64, 100, 30)];
    singleView.backgroundColor=[UIColor redColor];
    [self.view addSubview:singleView];
}
#pragma mark -------屏幕适配-------
CG_INLINE CGRect
CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    //屏幕适配比例
    float autoSizeScaleX;
    float autoSizeScaleY;
    if (ScreenHeight >480) {
        autoSizeScaleX = ScreenWidth/320;
        autoSizeScaleY = ScreenHeight/568;
        
    } else {
        autoSizeScaleX = 1.0;
        autoSizeScaleY = 1.0;
    }
    
    
    CGRect rect;
    rect.origin.x = x * autoSizeScaleX;
    rect.origin.y = y * autoSizeScaleY;
    rect.size.width = width * autoSizeScaleX;
    rect.size.height = height * autoSizeScaleY;
    
    return rect;
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
