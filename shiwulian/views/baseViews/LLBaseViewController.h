//
//  LLBaseViewController.h
//  shiwulian
//
//  Created by lin zoup on 4/5/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLNavigationController.h"

@interface LLBaseViewController : UIViewController

@property (nonatomic, assign) NSString *nagTitle;

//-(void)setLeftNagbarItem:(NSString *)imageName;
//-(void)setRightNagbarItem:(NSString *)imageName;

-(void)setLeftNagbarItem:(NSString *)imageName target:(id)target action:(SEL)action;
-(void)setRightNagbarItem:(NSString *)imageName target:(id)target action:(SEL)action;

-(void)setLeftNagBarPosX:(CGFloat)pos;
-(void)setRightNagBarPosX:(CGFloat)pos;
-(void)setLeftBarItemSize:(CGFloat)width height:(CGFloat)height;
-(void)setRightBarItemSize:(CGFloat)width height:(CGFloat)height;

-(void)showLeftArrow;

-(void)back;

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
