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


-(void)setTabBar:(UIView *)bar;
-(void)setTabBarTitle:(NSString *)text;

-(void)setTabBarItem:(UITabBarItem *)tabBarItem;

@end
