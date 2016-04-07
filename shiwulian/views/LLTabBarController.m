//
//  LLTabBarController.m
//  shiwulian
//
//  Created by lin zoup on 2/26/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLTabBarController.h"

#import "ext.h"

#import "LLNavigationController.h"
#import "LLHomeViewController.h"
#import "LLDynamicViewController.h"
#import "LLMineViewController.h"
#import "LLDefine.h"


@interface LLTabBarController () <UINavigationControllerDelegate> {
    CGFloat tagTagStart;
//    CGFloat homeTag;
//    CGFloat dynTag;
//    CGFloat mineTag;
    CGFloat iconTag;
    CGFloat labelTag;
}

@property (nonatomic, strong) UIView *toolView;

@end

@interface LLTabBarController () {
    NSMutableArray *buttons;
    NSInteger curSelectedIndex;
    UINavigationController *currentController;
}

@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation LLTabBarController

-(instancetype)init {
    self = [super init];
    if (self) {
//        homeTag = 1000;
//        dynTag = 1001;
//        mineTag = 1002;
        tagTagStart = 1000;
        iconTag = 2000;
        labelTag = 2001;
        
        curSelectedIndex = -1;
        
        [self initContent];
    }
    return self;
}

-(void)initContent {
    CGRect contentFtame = CGRectMake(0, 0, LL_Screen_Width, LL_Screen_Height-LL_Tool_Height);
    LLHomeViewController *homeController = [[LLHomeViewController alloc] init];
    LLNavigationController *homeNag = [[LLNavigationController alloc] initWithRootViewController:homeController];
    LLDynamicViewController *dynController = [[LLDynamicViewController alloc] init];
    LLNavigationController *dynNag = [[LLNavigationController alloc] initWithRootViewController:dynController];
    LLMineViewController *mineController = [[LLMineViewController alloc] init];
    LLNavigationController *mineNag = [[LLNavigationController alloc] initWithRootViewController:mineController];
    homeNag.view.frame = contentFtame;
    dynNag.view.frame = contentFtame;
    mineNag.view.frame = contentFtame;
    
    homeNag.delegate = self;
    homeNag.view.autoresizingMask = UIViewAutoresizingNone;

    [self addChildViewController:homeNag];
    [self addChildViewController:dynNag];
    [self addChildViewController:mineNag];
    
    [self.view addSubview:homeNag.view];
    [homeNag didMoveToParentViewController:self];
    currentController = homeNag;
    
    [self addToolView];
}

-(void)addToolView {
    if (_toolView) {
        return;
    }
    
    _toolView = [[UIView alloc]initWithFrame:CGRectMake(0, LL_Screen_Height-LL_Tool_Height, LL_Screen_Width, LL_Tool_Height)];
    _toolView.backgroundColor = LL_White;
    UIView *bgView = [[UIView alloc] init];
    bgView.frame = CGRectMake(0, 0, _toolView.frameWidth, _toolView.frameHeight);
    bgView.backgroundColor = LL_Gray_Tab;
    [_toolView addSubview:bgView];
    
    //添加线条
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bgView.frameWidth, 0.5)];
    lineView.backgroundColor = LL_Green_Bg;
//    [bgView addSubview:lineView];
    
    //添加按钮 主页 动态 我的
    CGFloat btnHeight = LL_Tool_Height;
    CGFloat btnTop = 0;
    CGFloat btnWidth = LL_Screen_Width/3.0;
    CGFloat btnLeft = 0;
    UIButton *homeBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnLeft, btnTop, btnWidth, btnHeight)];
    UIButton *dynBtn = [[UIButton alloc] initWithFrame:CGRectMake((LL_Screen_Width-btnWidth)/2, btnTop, btnWidth, btnHeight)];
    UIButton *mineBtn = [[UIButton alloc] initWithFrame:CGRectMake(LL_Screen_Width-btnLeft-btnWidth, btnTop, btnWidth, btnHeight)];
    homeBtn.tag = tagTagStart;
    dynBtn.tag = tagTagStart + 1;
    mineBtn.tag = tagTagStart + 2;
    
    //set button items
    [self setItemInBtn:homeBtn image:@"home.png" label:@"主页"];
    [self setItemInBtn:dynBtn image:@"dynamic.png" label:@"动态"];
    [self setItemInBtn:mineBtn image:@"mine.png" label:@"我的"];
    //add action
    [homeBtn addTarget:self action:@selector(onToolBarItemoTouch:) forControlEvents:UIControlEventTouchUpInside];
    [dynBtn addTarget:self action:@selector(onToolBarItemoTouch:) forControlEvents:UIControlEventTouchUpInside];
    [mineBtn addTarget:self action:@selector(onToolBarItemoTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    [_toolView addSubview:homeBtn];
    [_toolView addSubview:dynBtn];
    [_toolView addSubview:mineBtn];
    [self.view addSubview:_toolView];
    
    [self setSelect:0];
}

-(void)setItemInBtn:(UIButton *)btn image:(NSString *)imageName label:(NSString *)labelName {
    // add image
    CGFloat iconSize = 25.0;
    CGFloat posX = (btn.frameWidth - iconSize) / 2;
    CGFloat posY = 9;
    
    if (btn.tag == tagTagStart) {
        iconSize = 27.0;
        posY = 6;
        posX -= 2;
    } else if (btn.tag == tagTagStart + 2) {
        iconSize = 23.0;
        posY = 9;
//        posX -= 1;
    }
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithTintColor:LL_Black];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(posX, posY, iconSize, iconSize);
    imageView.tag = iconTag;
    [btn addSubview:imageView];
    
    //add label
    CGFloat labelHeight = 10;
    posY = btn.frameHeight - labelHeight - 4;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, posY, btn.frameWidth, labelHeight)];
    label.text = labelName;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:9.0];
    label.textColor = LL_Black;
    label.tag = labelTag;
    [btn addSubview:label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setSelect:(NSInteger)index {
    if (index == curSelectedIndex) {
        return;
    }
    
    //按钮点击添加动画效果
    
    NSInteger tag = tagTagStart + index;
    UIButton *btn = [_toolView viewWithTag:tag];
    UIImageView *imageView = [btn viewWithTag:iconTag];
    UILabel *label = [btn viewWithTag:labelTag];
    UIImage *image = [imageView.image imageWithTintColor:LL_Green];
    [imageView setImage:image]; 
    label.textColor = LL_Green;
    
    if (curSelectedIndex != -1) {
        //恢复上次选中按钮
        tag = tagTagStart + curSelectedIndex;
        btn = [_toolView viewWithTag:tag];
        imageView = [btn viewWithTag:iconTag];
        label = [btn viewWithTag:labelTag];
        image = [imageView.image imageWithTintColor:LL_Black];
        [imageView setImage:image];

        label.textColor = LL_Black;
        
        //跳转controller
        UINavigationController *selectNag = [self.childViewControllers objectAtIndex:index];
        [self transitionFromViewController:currentController toViewController:selectNag duration:0.1 options:UIViewAnimationOptionTransitionNone animations:nil completion:nil];
        currentController = selectNag;
    }
    
    curSelectedIndex = index;
}

-(void)onToolBarItemoTouch:(UIButton *)btn {
    NSLog(@">>>>>>>>>>>>>>>>> touch sender (tag %ld)", (long)btn.tag);
    
    NSInteger index = btn.tag - tagTagStart;
    if (index != curSelectedIndex) {
        [self setSelect:index];
    }
}


-(void)pushBtn {
    //push a new controller
    UIViewController *newView = [[UIViewController alloc] init];
    newView.view.backgroundColor = [UIColor blackColor];
    [currentController pushViewController:newView animated:YES];
}

-(void)navigationController:(UINavigationController *)navigationController
     willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [viewController.view setOriginX:10];
}

-(void)navigationController:(UINavigationController *)navigationController
      didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
////    [viewController.view setOriginX:10];
//    [viewController.view setFrameHeight:LL_Content_Height];
//    [viewController.view moveY:-LL_Content_Y];
}

@end
