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
    
    UILabel *titleView;
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
    
    //设置导航条背景色
    //默认绿色
    self.navigationBar.barTintColor = LL_Green;
    
    [self customBar];
}

-(void)customBar {
    if (_tabBarView) {
        [_tabBarView removeFromSuperview];
    }
    
    bgView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, LL_Screen_Width, LL_Status_Height + LL_Nag_Height)];
    bgView.backgroundColor = LL_Green;
//    [self.view addSubview:bgView];
    
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, LL_Status_Height, LL_Screen_Width, LL_Nag_Height)];
    _tabBarView.backgroundColor = [UIColor clearColor];
    
    titleView = [[UILabel alloc] initWithFrame:_tabBarView.frame];
    [titleView setOriginY:0];
    CGFloat titleWidth = 160.0;
    titleView.frame = CGRectMake(0, LL_Status_Height, titleWidth, LL_Nag_Height);
    [titleView setOriginX:(LL_Screen_Width - titleWidth)/2];
    titleView.font = [UIFont systemFontOfSize:15.0];
    titleView.textColor = [UIColor whiteColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.tag = titleTag;
    [self.view addSubview:titleView];
//    self.navigationItem.titleView = titleView;
    
//    [_tabBarView addSubview:titleView];
    //默认有左侧返回图标
//    [self.view addSubview:_tabBarView];
}

-(void)setTabBarColor:(UIColor *)color {
    self.navigationBar.barTintColor = color;
}

-(void)setBarTitle:(NSString *)barTitle {
    titleView.text = barTitle;
}


-(void)setTabBar:(UIView *)bar {
    if (_tabBarView) {
        [_tabBarView removeFromSuperview];
    }
    
    bar.frame = CGRectMake(0, LL_Status_Height, LL_Screen_Width, LL_Nag_Height);
    [self.view addSubview:bar];
}



-(void)setBackGroundColor:(UIColor *)color {
    bgView.backgroundColor = color;
}


-(void)setTabBarTitle:(NSString *)text {
//    UILabel *titleView = [_tabBarView viewWithTag:titleTag];
    titleView.text = text;
    
    title = text;
}

//右侧多个
-(void)setRightBarItems:(NSArray *)items {
    //图片或者文字
}


//自定义tab窗口
-(void)setTabBarItem:(UITabBarItem *)tabBarItem {
    
}


@end
