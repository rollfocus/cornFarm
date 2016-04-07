//
//  LLHomeViewController.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLHomeViewController.h"
#import "LLNavigationController.h"
#import "LLSearchView.h"

#import "LLTickerViewCell.h"
#import "LLRecSectionView.h"
#import "LLRecProductCell.h"
#import "LLRecFarmCell.h"

//#import "SVPullToRefresh.h"

#import "FCXRefreshFooterView.h"
#import "FCXRefreshHeaderView.h"
#import "UIScrollView+FCXRefresh.h"

//#import ""


@interface LLHomeViewController () <UITableViewDataSource, UITableViewDelegate> {
    CGFloat tickerHeight;
//    UIView *headerView;
//    UITableView *tableView;
    
    NSInteger numP;
    NSInteger numF;
    
    BOOL isLoading;
    
    FCXRefreshHeaderView *headerView;
    FCXRefreshFooterView *footerView;

}

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *tickerCellIdentifer = @"tickerCellIdentifer";
static NSString *sectionCellIdentifer = @"sectionCellIdentifer";
static NSString *productCellIdentifer = @"productCellIdentifer";
static NSString *farmCellIdentifer = @"farmCellIdentifer";


@implementation LLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LL_Gray;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setNagBarView];
    
    //创建tableview
    //UITableViewStyleGrouped;//去除粘滞效果
    _tableView = [[UITableView alloc] initWithFrame:
                 CGRectMake(0, 0, self.view.frameWidth, LL_Content_Height) style:UITableViewStyleGrouped];
//    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.backgroundColor = LL_Gray;
    _tableView.backgroundColor = LL_Gray;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"LLRecSectionView" bundle:nil] forCellReuseIdentifier:sectionCellIdentifer];
    [_tableView registerNib:[UINib nibWithNibName:@"LLRecProductCell" bundle:nil] forCellReuseIdentifier:productCellIdentifer];
    [_tableView registerNib:[UINib nibWithNibName:@"LLRecFarmCell" bundle:nil] forCellReuseIdentifier:farmCellIdentifer];

    numP = 1;
    numF = 3;
    
    //请求home数据并刷新展示
    [self addRefreshView];
}

- (void)addRefreshView {
    __weak __typeof(self)weakSelf = self;
    
    //下拉刷新
    headerView = [_tableView addHeaderWithRefreshHandler:^(FCXRefreshBaseView *refreshView) {
        [weakSelf refreshAction];
    }];
    return;
    
    //上拉加载更多
    footerView = [_tableView addFooterWithRefreshHandler:^(FCXRefreshBaseView *refreshView) {
        [weakSelf loadMoreAction];
    }];
    //自动刷新
    footerView.autoLoadMore = NO;
}

- (void)refreshAction {
    __weak UITableView *weakTableView = _tableView;
    __weak FCXRefreshHeaderView *weakHeaderView = headerView;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        numP += 1;
        [weakTableView reloadData];
        [weakHeaderView endRefresh];
        isLoading = NO;
    });
}



- (void)loadMoreAction {
    __weak UITableView *weakTableView = _tableView;
    __weak FCXRefreshFooterView *weakFooterView = footerView;
    
    if (numF > 6) {
        [footerView endRefresh];
        return;
    }
    
    //简单模拟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        numF += 1;
        [weakTableView reloadData];
        [weakFooterView endRefresh];
        isLoading = NO;
    });
}

-(void)dealloc {
    //[_tableView removeObserver:self forKeyPath:@"contentOffset"];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)setupRefresh {
    UIRefreshControl  *control = [[UIRefreshControl alloc] init];
    [control addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
    [control beginRefreshing];
    [self refreshData:control];
}

-(void)setNagBarView {
    //可改变navigation的左右控件 背景色 以及 offset值等来自定义导航条
    
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LL_Screen_Width, LL_Nag_Height)];
    barView.backgroundColor = [UIColor clearColor];
//    barView.backgroundColor = LL_Green;

    CGFloat marginLeft = 10.0;
    //搜索框
    LLSearchView *searchView = [[LLSearchView alloc] init];
    searchView.placeText = @"    产品|体验";
    [searchView setOriginX:marginLeft];
    [barView addSubview:searchView];
    
    //右侧扫码收藏图标
    CGFloat iconSize = 20;
    UIImageView *basketIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"basket.png"]];
    UIImageView *scanIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scan.png"]];
    basketIconView.frame = CGRectMake([barView maxOriginX]-iconSize-marginLeft,
                                      ([barView frameHeight]-iconSize)/2, iconSize, iconSize);
    scanIconView.frame = basketIconView.frame;
    [scanIconView setOriginX:([scanIconView originX] - iconSize - 8)];
    [scanIconView scaleViewFrame:0.85];
    [basketIconView scaleViewFrame:1.1];
    [basketIconView moveY:2.0];
    [barView addSubview:basketIconView];
    [barView addSubview:scanIconView];
    
    LLNavigationController *nag = (LLNavigationController *)self.navigationController;
    [nag setTabBar:barView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - table view delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 + 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    if (section == 0) {
        rows = 0;//ticker
    } else if (section == 1) {
        rows = numP;//product
    } else if (section == 2) {
        rows = numF;//farm
    }
    return rows;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSInteger height = 0.0;
    if (section == 0) {
        height = [LLTickerViewCell cellHeight];
//        height = 10;
    } else if (section == 2 || section == 1) {
        height = [LLRecSectionView height];
    }
    return height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0.0;
    NSInteger section = indexPath.section;
    if (section == 0) {
        height = 0.0;
    } else if (section == 1) {
        height = [LLRecProductCell cellHeight];
    } else if (section == 2) {
        height = [LLRecFarmCell cellHeight];
    }
    return height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
        
    UIView *secView = nil;
    if (section == 0) {
        secView = [[LLTickerViewCell alloc] init];
    } else {
//        LLRecSectionView *cellView = [[LLRecSectionView alloc] init];
//        if (section == 1) {
//            cellView.title = @"产品推荐";
//        } else if (section == 2) {
//            cellView.title = @"农场推荐";
//        }
//        secView = cellView;
        
        LLRecSectionView *cellView  = [tableView dequeueReusableCellWithIdentifier:sectionCellIdentifer];
        secView = cellView;

    }
    
    return secView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLBaseTableViewCell *cell =  nil;
    NSInteger section = indexPath.section;
    if (section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:productCellIdentifer];
        if (!cell) {
//            cell = [[LLRecProductCell alloc] init];
        }
        //读取数据并设置
    } else if (section == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:farmCellIdentifer];
        if (!cell) {
//            cell = [[LLRecFarmCell alloc] init];
        }
        //读取数据
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@">>>>>>>>>>>>select section:%ld,row:%ld", indexPath.section, indexPath.row);
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        CGFloat minOffset = 0;//64.0; //section头的最终位置
        CGFloat maxOffset = tickerHeight;
        CGFloat inset = -offset.y;
        if (inset >= 0 && inset >= minOffset) {
            if (inset <= maxOffset) {
                _tableView.contentInset = UIEdgeInsetsMake(inset, 0, 0, 0);
            } else {
                //移动刷新视图
            }
        } else {
            _tableView.contentInset = UIEdgeInsetsMake(minOffset, 0, 0, 0);
            
        }
    }
}


-(void)refreshData:(UIRefreshControl *)control{
    
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    return;
    
    //下拉放大视图
    CGFloat tickerHeight = 160.0f;
    CGFloat down = - scrollView.contentOffset.y -(tickerHeight);
    if (down < 0) {
        down = 0;
    }
    CGRect frame = _headerView.frame;
    frame.size.height = tickerHeight + down;
    frame.origin.y = -frame.size.height;
    _headerView.frame = frame;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

@end
