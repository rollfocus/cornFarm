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
    UIView *leftBarItem;
    NSMutableArray *rightBarItems;
    NSInteger titleTag;
    NSString *title;
}
@end

@implementation LLNavigationController

-(instancetype)init {
    if (self = [super init]) {
    }
    return self;
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

    //初始化参数
    titleTag = 1902;
    if (rightBarItems) {
        [rightBarItems removeAllObjects];
    }
    rightBarItems = [[NSMutableArray alloc] init];

    self.view.frame = CGRectMake(0, 0, LL_Screen_Width, LL_Screen_Height-LL_Tool_Height);
    self.view.backgroundColor = LL_Gray;
    self.view.backgroundColor = [UIColor whiteColor];

    
    //覆盖默认视图
//    [self setNavigationBarHidden:YES];
    [self setTabBar];
    
//    for (UIViewController *controller in self.viewControllers) {
//        controller.view .
//    }
}

-(void)setTabBar {
    if (_tabBarView) {
        [_tabBarView removeFromSuperview];
    }
    
    bgView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, LL_Screen_Width, LL_Status_Height + LL_Nag_Height)];
    bgView.backgroundColor = LL_Green;
    [self.view addSubview:bgView];
    
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, LL_Status_Height, LL_Screen_Width, LL_Nag_Height)];
    _tabBarView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleView = [[UILabel alloc] initWithFrame:_tabBarView.frame];
    [titleView setOriginY:0];
    titleView.font = [UIFont systemFontOfSize:15.0];
    titleView.textColor = [UIColor whiteColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.tag = titleTag;
    [_tabBarView addSubview:titleView];
    
    
    //默认有左侧返回图标
    
    [self.view addSubview:_tabBarView];
}

-(void)setBackGroundColor:(UIColor *)color {
    bgView.backgroundColor = color;
}

-(void)setTabBarColor:(UIColor *)color {
    _tabBarView.backgroundColor = color;
}

-(void)setTabBarTitle:(NSString *)text {
    UILabel *titleView = [_tabBarView viewWithTag:titleTag];
    titleView.text = text;
    
    title = text;
}

//左侧一个
-(void)setLeftBarItem:(UIImage *)image text:(NSString *)text {
    //有图片显示图片，没图片显示文字，两个都有拉长显示
}

//右侧一个
-(void)setRightBarItem:(UIImage *)image text:(NSString *)text {
    //图片或者文字
}

//右侧多个
-(void)setRightBarItems:(NSArray *)items {
    //图片或者文字
}

-(void)setTabBar:(UIView *)bar {
    if (_tabBarView) {
        [_tabBarView removeFromSuperview];
    }
    
    bar.frame = CGRectMake(0, LL_Status_Height, LL_Screen_Width, LL_Nag_Height);
    [self.view addSubview:bar];
}

//自定义tab窗口
-(void)setTabBarItem:(UITabBarItem *)tabBarItem {
    
}


@end
