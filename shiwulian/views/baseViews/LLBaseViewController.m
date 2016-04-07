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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNagTitle:(NSString *)nagTitle {
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    nag.barTitle = nagTitle;
}

-(void)setLeftNagbarItem:(NSString *)imageName target:(id)target action:(SEL)action {
//    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
//    iconView.frame = CGRectMake(0, 0, 20, 20);
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:iconView];
//    self.navigationItem.leftBarButtonItem = barItem;
//    
//    if (target && action) {
//        iconView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
//        tapGesture.numberOfTapsRequired = 1;
//        tapGesture.numberOfTouchesRequired = 1;
//        [iconView addGestureRecognizer:tapGesture];
//    }
    
    [self setNagBarItem:imageName target:target action:action left:YES];
}

-(void)setRightNagbarItem:(NSString *)imageName target:(id)target action:(SEL)action {
//    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
//    iconView.frame = CGRectMake(0, 0, 20, 20);
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:iconView];
//    self.navigationItem.rightBarButtonItem = barItem;
//    
//    if (target && action) {
//        iconView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
//        tapGesture.numberOfTapsRequired = 1;
//        tapGesture.numberOfTouchesRequired = 1;
//        [iconView addGestureRecognizer:tapGesture];
//    }
    
    [self setNagBarItem:imageName target:target action:action left:NO];

}

-(void)setNagBarItem:(NSString *)imageName target:(id)target action:(SEL)action left:(BOOL)isLeft {
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    iconView.frame = CGRectMake(0, 0, 20, 18);
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:iconView];
    
    if (target && action) {
        iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        [iconView addGestureRecognizer:tapGesture];
    }

    if (isLeft) {
        self.navigationItem.leftBarButtonItem = barItem;
    } else {
        self.navigationItem.rightBarButtonItem = barItem;
    }
}

-(void)setLeftBarItemSize:(CGFloat)width height:(CGFloat)height {
    [self setBarItemSize:width height:height left:YES];
}

-(void)setRightBarItemSize:(CGFloat)width height:(CGFloat)height {
    [self setBarItemSize:width height:height left:NO];
}

-(void)setBarItemSize:(CGFloat)width height:(CGFloat)height left:(BOOL)isLeft {
    UIView *iconView = nil;
    if (isLeft) {
        iconView = self.navigationItem.leftBarButtonItem.customView;
    } else {
        iconView = self.navigationItem.rightBarButtonItem.customView;
    }
    
    iconView.frameWidth = width;
    iconView.frameHeight = height;
}


@end
