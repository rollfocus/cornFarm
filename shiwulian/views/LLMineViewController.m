
//
//  LLMineViewController.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLMineViewController.h"
#import "LLBaseTableViewCell.h"

@interface LLMineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *loginCellIndentifer = @"loginCellIndentifer";
static NSString *settingCellIndentifer = @"settingCellIndentifer";
static NSString *feedCellIndentifer = @"settingCellIndentifer";

@implementation LLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationItem.title = @"我的";
    
    self.nagTitle = @"我的";
    
    
    //设置背景
    self.view.backgroundColor = LL_Gray;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //创建tableview
    _tableView = [[UITableView alloc] initWithFrame:
                  CGRectMake(0, 0, self.view.frameWidth, LL_Content_Height) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = LL_Gray;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
//    [_tableView registerNib:[UINib nibWithNibName:@"LLDynHeadCell" bundle:nil] forCellReuseIdentifier:headCellIdentifer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//根据是否登录显示不同单元格
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0.0;
    switch (indexPath.row) {
        case 0:
            height = 100.0;
            break;
            
        case 1:
        case 2:
            height = 60.0;
            break;
            
        default:
            break;
    }
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    NSInteger row = indexPath.row;
    if (row == 0) {
        cell = [_tableView dequeueReusableCellWithIdentifier:loginCellIndentifer];
        if (!cell) {
            cell = [[LLBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginCellIndentifer];
            cell.backgroundColor = [UIColor redColor];
        }
    } else if (row == 1) {
        cell = [_tableView dequeueReusableCellWithIdentifier:settingCellIndentifer];
        if (!cell) {
            cell = [[LLBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:settingCellIndentifer];
            cell.backgroundColor = [UIColor greenColor];
        }
    } else if (row == 2) {
        cell = [_tableView dequeueReusableCellWithIdentifier:feedCellIndentifer];
        if (!cell) {
            cell = [[LLBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedCellIndentifer];
            cell.backgroundColor = [UIColor blueColor];
        }
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
