//
//  LLLoginViewController.m
//  shiwulian
//
//  Created by lin zoup on 4/7/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLLoginViewController.h"

@interface LLLoginViewController ()

@end

@implementation LLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.nagTitle = @"登录/注册";
    [self setLeftNagbarItem:@"arrow_left.png" target:self action:@selector(back)];
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
