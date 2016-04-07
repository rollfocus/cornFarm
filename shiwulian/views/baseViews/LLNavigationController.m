//
//  LLNavigationController.m
//  shiwulian
//
//  Created by lin zoup on 2/29/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLNavigationController.h"
#import "ext.h"

@interface LLNavigationController () {
    UIView *bgView;
//    UILabel *titleView;
    UIView *curBarView;
    NSMutableArray *allBarViews;
}
@end

@implementation LLNavigationController

-(instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

-(void)dealloc {
    [allBarViews removeAllObjects];
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self initContent];
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)initContent {
    //状态栏透明
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    self.view.frame = CGRectMake(0, 0, LL_Screen_Width, LL_Screen_Height-LL_Tool_Height);
    self.view.backgroundColor = LL_Gray;
    
    //设置导航条背景色
    //默认绿色
//    self.navigationBar.barTintColor = LL_Green;
    
    [self customBar];
    
    //初始化变量
    if (!allBarViews) {
        allBarViews = [[NSMutableArray alloc] init];
    }
//    curBarView = nil;
}

-(void)customBar {
    //背景图
    bgView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, LL_Screen_Width, LL_Status_Height + LL_Nag_Height)];
    bgView.backgroundColor = LL_Green;
    [self.view addSubview:bgView];
    [self.view insertSubview:bgView atIndex:2];
    
//    _tabBarView.backgroundColor = [UIColor clearColor];
//    //标题栏
//    titleView = [[UILabel alloc] initWithFrame:_tabBarView.frame];
//    [titleView setOriginY:0];
//    CGFloat titleWidth = 160.0;
//    titleView.frame = CGRectMake(0, LL_Status_Height, titleWidth, LL_Nag_Height);
//    [titleView setOriginX:(LL_Screen_Width - titleWidth)/2];
//    titleView.font = [UIFont systemFontOfSize:15.0];
//    titleView.textColor = [UIColor whiteColor];
//    titleView.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:titleView];
}

-(void)setTabBarColor:(UIColor *)color {
//    self.navigationBar.barTintColor = color;
    bgView.backgroundColor = color;
}

-(void)setBarTitle:(NSString *)barTitle {
    UILabel *titleView = [_tabBarView viewWithTag:1000];
    titleView.text = barTitle;
    _barTitle = barTitle;
}


-(void)setTabBar:(UIView *)bar {
    if (_tabBarView) {
        [_tabBarView removeFromSuperview];
    }
    NSInteger last = allBarViews.count - 1;
    [allBarViews removeObjectAtIndex:last];
    
    _tabBarView = bar;
    _tabBarView.frame = CGRectMake(0, LL_Status_Height, LL_Screen_Width, LL_Nag_Height);
    [self.view addSubview:_tabBarView];
    [allBarViews addObject:_tabBarView];
}

-(void)setBackGroundColor:(UIColor *)color {
//    bgView.backgroundColor = color;
    _tabBarView.backgroundColor = color;
}

-(void)setLeftItemView:(UIView *)leftItemView {
    if (_leftItemView) {
        [_leftItemView removeFromSuperview];
    }
    _leftItemView = leftItemView;
    
    if (leftItemView) {
//        [self.view addSubview:_leftItemView];
//        [self.view bringSubviewToFront:_leftItemView];
        [_tabBarView addSubview:_leftItemView];
        [_tabBarView bringSubviewToFront:_leftItemView];
        
        //调整位置
        _leftItemView.originX = 15.0;
        _leftItemView.originY = (LL_Nag_Height - leftItemView.frameHeight) / 2.0;
    }
}

-(void)setRightItemView:(UIView *)rightItemView {
    if (_rightItemView) {
        [_rightItemView removeFromSuperview];
    }
    _rightItemView = rightItemView;
    
    if (rightItemView) {
//        [self.view addSubview:_rightItemView];
//        [self.view bringSubviewToFront:_rightItemView];
        [_tabBarView addSubview:_rightItemView];
        [_tabBarView bringSubviewToFront:_rightItemView];

        //调整位置
        _rightItemView.originX = LL_Screen_Width - rightItemView.frameWidth - 15.0;
        _rightItemView.originY = (LL_Nag_Height - rightItemView.frameHeight) / 2.0;
    }
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated {
    //移除最后一个barView
    NSInteger last = allBarViews.count - 1;
    [allBarViews removeObjectAtIndex:last];
    [_tabBarView removeFromSuperview];
    
    last -= 1;
    if (last >= 0) {
        _tabBarView = [allBarViews objectAtIndex:last];
    } else {
        _tabBarView = nil;
    }
//    _tabBarView = al
    
    
    return [super popViewControllerAnimated:animated];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [self createNewBarView];
    [super pushViewController:viewController animated:animated];
}

-(void)createNewBarView {
    if (!allBarViews) {
        allBarViews = [[NSMutableArray alloc] init];
    }
    
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, LL_Status_Height,
                                                               LL_Screen_Width, LL_Nag_Height)];
    barView.backgroundColor = LL_Green;
    UILabel *label = [[UILabel alloc] initWithFrame:_tabBarView.frame];
    [label setOriginY:0];
    CGFloat titleWidth = 160.0;
    label.frame = CGRectMake(0, 0, titleWidth, LL_Nag_Height);
    [label setOriginX:(LL_Screen_Width - titleWidth)/2];
    label.font = [UIFont systemFontOfSize:15.0];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 1000;
    [barView addSubview:label];
    
    //充值当前bar窗口
    _tabBarView = barView;
    [self.view addSubview:_tabBarView];
    [allBarViews addObject:_tabBarView];
    [self.view bringSubviewToFront:_tabBarView];
}


@end
