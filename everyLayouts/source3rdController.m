//
//  source3rdController.m
//  iOSLayOut
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 HKTX. All rights reserved.
//

#import "source3rdController.h"
#import <Masonry.h>
#import <PureLayout.h>
#import <MLLayout.h>
@interface source3rdController ()
@property (nonatomic, strong) UIView *bkgView;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) MLLayout *layout;
@end

@implementation source3rdController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1、 purelayout 举例使用
    
//    UIView *singleView=[[UIView alloc]init];
//    singleView.backgroundColor=[UIColor redColor];
//    [self.view addSubview:singleView];
//    [singleView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:64+20];
//    [singleView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
//    [singleView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-20];
//    [singleView autoSetDimension:ALDimensionHeight toSize:100];//设置高度
    
    //2、masonry 举例使用
    
//    UIView *singleView=[[UIView alloc]init];
//    singleView.backgroundColor=[UIColor redColor];
//    [self.view addSubview:singleView];
//    [singleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).with.offset(10);
//        make.right.mas_equalTo(self.view).with.offset(-40);
//        make.top.mas_equalTo(self.view).with.offset(64+30);
//        make.height.mas_equalTo(100);
//    }];
    
    
    //3、mlllayout 举例使用
    NSInteger tag = 100;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.918 green:0.918 blue:0.875 alpha:1.000];
    self.view.tag = tag++;
    
    _bkgView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRed:0.986 green:1.000 blue:0.971 alpha:1.000];
        view.tag = 101;
        [self.view addSubview:view];
        view;
    });
    
    _firstLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor redColor];
        label.numberOfLines = 0;
        label.font = [UIFont boldSystemFontOfSize:14.0];
        label.text = @"Inception";
        label.tag = tag++;
        [_bkgView addSubview:label];
        label;
    });
    
    _secondLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor colorWithRed:0.239 green:0.204 blue:0.176 alpha:1.000];
        label.backgroundColor = [UIColor clearColor];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:14.0];
        label.text = @"Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb's rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible-inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming.";
        label.tag = tag++;
        [_bkgView addSubview:label];
        label;
    });
    
    
    //change layout button
    _button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitle:@"Change Layout" forState:UIControlStateNormal];
        button.tag = tag++;
        [self.view addSubview:button];
        button;
    });
    
    //imageView
    _imageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"flex"]];
        imageView.tag = tag++;
        [self.view addSubview:imageView];
        imageView;
    });
    
    //display switch button
    UIButton *displaySwitchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    displaySwitchButton.backgroundColor = [UIColor lightGrayColor];
    [displaySwitchButton setTitle:@"Remove" forState:UIControlStateNormal];
    displaySwitchButton.tag = tag++;
    [self.view addSubview:displaySwitchButton];
    
    _layout = [MLLayout layoutWithTagView:self.view block:^(MLLayout * _Nonnull l) {
        l.flexDirection = MLLayoutFlexDirectionColumn;
        l.justifyContent = MLLayoutJustifyContentCenter;
        l.alignItems = MLLayoutAlignmentCenter;
        l.sublayouts = @[
                         [MLLayout layoutWithTagView:nil block:^(MLLayout * _Nonnull l) {
                             //test MLLayoutPositionAbsolute
                             l.position = MLLayoutPositionAbsolute;
                             l.bottom = 30.0f;
                             l.right = 20.0;
                             l.flexDirection = MLLayoutFlexDirectionColumn;
                             l.sublayouts = @[
                                              [MLLayout layoutWithTagView:_button block:nil],
                                              [MLLayout layoutWithTagView:displaySwitchButton block:^(MLLayout * _Nonnull l) {
                                                                                                    l.marginTop = 1.0f;
                                              }]
                                              ];
                         }],
                         [MLLayout layoutWithTagView:_imageView block:^(MLLayout * _Nonnull l) {
                             //test MLLayoutPositionRelative
                             l.position = MLLayoutPositionRelative;
                             l.bottom = 10.0f;
                         }],
                         [MLLayout layoutWithTagView:_bkgView block:^(MLLayout * _Nonnull l) {
                             l.marginLeft = l.marginRight = 10.0f;
                             //test for round pixel
                             l.padding = UIEdgeInsetsMake(30.f, 30.f, 30.f, 30.f);
                             
                             l.flexDirection = MLLayoutFlexDirectionColumn;
                             l.alignItems = MLLayoutAlignmentCenter;
                             l.alignSelf = MLLayoutAlignmentCenter;
                             l.sublayouts = @[
                                              [MLLayout layoutWithTagView:_firstLabel block:nil],
                                              //placeholder(nil view) as sapce
                                              //                                              [MLLayout layoutWithTagView:nil block:^(MLLayout * _Nonnull l) {
                                              //                                                  l.height = 10.0f;
                                              //                                              }],
                                              [MLLayout layoutWithTagView:_secondLabel block:^(MLLayout * _Nonnull l) {
                                                  l.marginTop = 40.0f; //space
                                                  l.flex = -1;
                                              }],
                                              ];
                         }],
                         ];
    }];
}
// 这个是非常重要的，如果是在布局完成之后渲染到页面的上的
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //just calculate new frames of views and auto set new frames to them
    //same with `[self layoutViewsWithUpdatedLayouts:[self updatedLayoutsAfterLayoutCalculationWithFrame]];`
    [_layout layoutViewsWithFrame:self.view.bounds];
    
    //wo can also set the frame manually or changed the calculated frame here.
    //#define kButtonWidth 120.0f
    //    _button.frame = CGRectMake((self.view.frame.size.width-kButtonWidth)/2, self.view.frame.size.height-150, kButtonWidth, 50);
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
