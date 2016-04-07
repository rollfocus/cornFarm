
//
//  LLMineViewController.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLMineViewController.h"
#import "LLBaseTableViewCell.h"
#import "LLLoginViewController.h"

#import "LLDynHeadCell.h"
#import "LLDynItemCell.h"

@interface LLMineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *loginCellIndentifer = @"loginCellIndentifer";
static NSString *basicCellIndentifer = @"basicCellIndentifer";

@implementation LLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.view.backgroundColor = LL_Gray;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    //创建tableview
//    //UITableViewStyleGrouped;//去除粘滞效果
//    _tableView = [[UITableView alloc] initWithFrame:
//                  CGRectMake(0, 0, self.view.frameWidth, LL_Content_Height) style:UITableViewStyleGrouped];
//    //    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    //    _tableView.backgroundColor = LL_Gray;
//    _tableView.backgroundColor = LL_Gray;
//    _tableView.showsVerticalScrollIndicator = NO;
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    [self.view addSubview:_tableView];
//    return;
    // Do any additional setup after loading the view.
    
//    self.navigationController.navigationBar.translucent = NO;
////    self.navigationItem.title = @"我的";
//    self.nagTitle = @"动态";
//    [self setLeftNagbarItem:@"add.png" target:self action:nil];
//    [self setRightNagbarItem:@"scan.png" target:self action:nil];
//    [self setLeftBarItemSize:18 height:18];
//    [self setRightBarItemSize:18 height:18];
//    
//    //设置背景
//    self.view.backgroundColor = LL_Gray;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    //创建tableview
//    _tableView = [[UITableView alloc] initWithFrame:
//                  CGRectMake(0, 0, self.view.frameWidth, LL_Content_Height) style:UITableViewStyleGrouped];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.backgroundColor = LL_Gray;
//    _tableView.showsVerticalScrollIndicator = NO;
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    [self.view addSubview:_tableView];
//    
////    [_tableView registerNib:[UINib nibWithNibName:@"LLDynHeadCell" bundle:nil] forCellReuseIdentifier:headCellIdentifer];
////    [_tableView registerNib:[UINib nibWithNibName:@"LLDynItemCell" bundle:nil] forCellReuseIdentifier:dynItemCellIdentifer];
//    return;
    
    self.nagTitle = @"我的";
    [self setRightNagbarItem:@"scan.png" target:self action:nil];

    
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
    
//    [_tableView registerNib:[UINib nibWithNibName:@"LLDynHeadCell" bundle:nil] forCellReuseIdentifier:loginCellIndentifer];
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

-(CGFloat)tableView:(UITableView *)tableView    :(NSInteger)section {
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0.0;
    switch (indexPath.row) {
        case 0:
            height = 76.0 + 14.0;
            break;
            
        case 1:
        case 2:
            height = 64.0;
            break;
            
        default:
            break;
    }
    return height;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    cell.backgroundColor = [UIColor blueColor];
//    return cell;
//}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    cell.backgroundColor = [UIColor redColor];
//    return cell;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLBaseTableViewCell *cell = nil;
    
    NSInteger row = indexPath.row;
    if (row == 0) {
        cell = [self cellForMineLogin];
    } else if (row == 1) {
        cell = [self cellForMineBasic];
        UILabel *label = [cell viewWithTag:3001];
        label.text = @"通用设置";
    } else if (row == 2) {
        cell = [self cellForMineBasic];
        UILabel *label = [cell viewWithTag:3001];
        label.text = @"意见反馈";
    }

    return cell;
}

-(LLBaseTableViewCell *)cellForMineLogin {
    LLBaseTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:loginCellIndentifer];
    if (!cell) {
        cell = [[LLBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginCellIndentifer];
        cell.backgroundColor = [UIColor clearColor];
        //自定义单元格
        CGFloat bgHeight = 76.0;
        CGFloat bgTop = 8.0;
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, bgTop, LL_Screen_Width, bgHeight)];
        bgView.backgroundColor = [UIColor whiteColor];
        [cell addSubview:bgView];
        
        //添加图像
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"112.png"]];
        CGFloat imageSize = 60.0;
        imageView.frame = CGRectMake(0, 0, imageSize, imageSize);
        imageView.originX = 10;
        imageView.originY = (bgHeight-imageSize)/2.0;
        [imageView showAsCircle];
        [bgView addSubview:imageView];
        //label
        CGFloat labelHeight = 20.0;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.maxOriginX + 8, 0, 80, labelHeight)];
        label.originY = (bgHeight-labelHeight)/2;
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = [UIColor blackColor];
        label.text = @"注册/登录";
        [bgView addSubview:label];
        
        //右侧箭头
        UIImageView *arrowImage = [cell showRightArrow];
        arrowImage.originY = (bgHeight - arrowImage.frameHeight)/2 + bgTop;
    }
    return cell;
}

-(LLBaseTableViewCell *)cellForMineBasic {
    LLBaseTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:basicCellIndentifer];
    if (!cell) {
        cell = [[LLBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:basicCellIndentifer];
        cell.backgroundColor = [UIColor clearColor];
        
        CGFloat bgHeight = 60.0;
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LL_Screen_Width, bgHeight)];
        bgView.backgroundColor = [UIColor whiteColor];
        [cell addSubview:bgView];
        
        CGFloat labelHeight = 20.0;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, labelHeight)];
        label.originY = (bgHeight-labelHeight)/2.0;
        label.font = [UIFont systemFontOfSize:14.0];
        label.textColor = [UIColor blackColor];
        label.tag = 3001;
        [bgView addSubview:label];
        
        //右侧箭头
        UIImageView *arrowImage = [cell showRightArrow];
        arrowImage.originY = (bgHeight - arrowImage.frameHeight)/2;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@">>>>>>>>>> did select cell: %ld section, %ld row", (long)indexPath.section, (long)indexPath.row);

    NSInteger row = indexPath.row;
    if (row == 0) {
        LLLoginViewController *loginController = [[LLLoginViewController alloc] initWithNibName:@"LLLoginViewController" bundle:nil];
//        [self.navigationController pushViewController:loginController animated:YES];
        [self pushViewController:loginController animated:YES];
    }
}

@end
