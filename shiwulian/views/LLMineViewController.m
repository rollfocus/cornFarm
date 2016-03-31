
//
//  LLMineViewController.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLMineViewController.h"
#import "LLNavigationController.h"

@interface LLMineViewController ()

@end

@implementation LLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor greenColor];
    
//    self.navigationItem.title = @"我的";
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    [nag setTabBarTitle:@"我的"];
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
