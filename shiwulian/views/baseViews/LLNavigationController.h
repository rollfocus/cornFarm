//
//  LLNavigationController.h
//  shiwulian
//
//  Created by lin zoup on 2/29/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLDefine.h"

@interface LLNavigationController : UINavigationController

@property (nonatomic, strong) UIView *tabBarView;
@property (nonatomic, strong) UIView *leftItemView;
@property (nonatomic, strong) UIView *rightItemView;

@property (nonatomic, assign) NSString *barTitle;

-(void)setTabBarColor:(UIColor *)color;
-(void)setTabBar:(UIView *)bar;


@end
