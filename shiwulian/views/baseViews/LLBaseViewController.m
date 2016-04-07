//
//  LLBaseViewController.m
//  shiwulian
//
//  Created by lin zoup on 4/5/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLBaseViewController.h"

@interface LLBaseViewController ()

@end

@implementation LLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self showLeftArrow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNagTitle:(NSString *)nagTitle {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    nag.barTitle = nagTitle;
}


-(void)showLeftArrow {
    [self setLeftNagbarItem:@"arrow_left.png" target:self action:@selector(back)];
}


-(void)setLeftNagbarItem:(NSString *)imageName target:(id)target action:(SEL)action {
    [self setNagBarItem:imageName target:target action:action left:YES];
}

-(void)setRightNagbarItem:(NSString *)imageName target:(id)target action:(SEL)action {
    [self setNagBarItem:imageName target:target action:action left:NO];
}

-(void)setNagBarItem:(NSString *)imageName target:(id)target action:(SEL)action left:(BOOL)isLeft {
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    if (target && action) {
        iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        [iconView addGestureRecognizer:tapGesture];
    }
    iconView.frame = CGRectMake(0, 0, 18, 18);
    
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    if (isLeft) {
        nag.leftItemView = iconView;
    } else {
        nag.rightItemView = iconView;
    }
}

-(void)setLeftNagBarPosX:(CGFloat)pos {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    nag.leftItemView.originX = pos;
}

-(void)setRightNagBarPosX:(CGFloat)pos {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    nag.rightItemView.originX = pos;
}

-(void)setLeftBarItemSize:(CGFloat)width height:(CGFloat)height {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    nag.leftItemView.frameWidth = width;
    nag.leftItemView.frameHeight = height;
}

-(void)setRightBarItemSize:(CGFloat)width height:(CGFloat)height {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    nag.rightItemView.frameWidth = width;
    nag.rightItemView.frameHeight = height;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    [nag pushViewController:viewController animated:animated];
}


-(void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
