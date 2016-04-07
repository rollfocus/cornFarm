//
//  LLDynamicViewController.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLDynamicViewController.h"
#import "LLBaseViewController.h"
#import "LLDynHeadCell.h"
#import "LLDynItemCell.h"


@interface LLDynamicViewController () <UITableViewDataSource, UITableViewDelegate, DynSecSwitchDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *headCellIdentifer = @"headCellIdentifer";
static NSString *dynItemCellIdentifer = @"dynItemCellIdentifer";


@implementation LLDynamicViewController

-(instancetype)init {
    if (self = [super init]) {
        //create navigation
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    
//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationItem.title = @"动态";
    
    self.nagTitle = @"动态";
    [self setLeftNagbarItem:@"msg.png" target:self action:@selector(gotoMsg)];
    [self setRightNagbarItem:@"scan.png" target:self action:@selector(gotoScan)];
    [self setLeftBarItemSize:18 height:18];
    [self setRightBarItemSize:16 height:16];
    
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
    
    [_tableView registerNib:[UINib nibWithNibName:@"LLDynHeadCell" bundle:nil] forCellReuseIdentifier:headCellIdentifer];
    [_tableView registerNib:[UINib nibWithNibName:@"LLDynItemCell" bundle:nil] forCellReuseIdentifier:dynItemCellIdentifer];
//                                                  LLDynItemCell

}

-(void)gotoMsg {
    NSLog(@">>>>>>>>>>>>>>>>>> goto msg");
    UIViewController *ctl = [[UIViewController alloc] init];
    [self.navigationController pushViewController:ctl animated:YES];
}

-(void)gotoScan {
    NSLog(@">>>>>>>>>>>>>>>>>>>>> goto scan");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [LLDynHeadCell cellHeight];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //根据数据计算单元格高度
    return [LLDynItemCell cellHeight];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LLDynHeadCell *cell = [_tableView dequeueReusableCellWithIdentifier:headCellIdentifer];
    cell.delegate = self;
    return cell;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLDynItemCell *cell = [_tableView dequeueReusableCellWithIdentifier:dynItemCellIdentifer];
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@">>>>>>>>>>>>>>>> select what//");
}


#pragma mark -  DynSecSwitchDelegate
-(void)swicthDyn:(BOOL)isMine {
    NSLog(@">>>>>>>>>>> switch to %d", isMine);
}


@end
