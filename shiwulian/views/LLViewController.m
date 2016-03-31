//
//  LLViewController.m
//  shiwulian
//
//  Created by lin zoup on 3/21/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLViewController.h"
#import "LLTabBarController.h"

@interface LLViewController ()

@end

@implementation LLViewController

-(instancetype)init {
    if (self = [super init]) {
        LLTabBarController *controller = [[LLTabBarController alloc] init];
        NSMutableArray *arr = [NSMutableArray new];
        [arr addObject:controller];
        [self setViewControllers:arr];
        self.navigationBarHidden = YES;
        
        
        
        //test视图窗口层级
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height-500, Screen_Width, 100)];
//        view.backgroundColor = [UIColor blackColor];
//        [self.view addSubview:view];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
