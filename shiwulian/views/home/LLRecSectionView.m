//
//  LLRecSectionView.m
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLRecSectionView.h"
#import "LLDefine.h"

@interface LLRecSectionView ()

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIView *rightView;

@end

static CGFloat cellHeight = 32.0;

@implementation LLRecSectionView

+(CGFloat)height {
    return cellHeight;
}

-(void)awakeFromNib {
    NSLog(@">>>>fuck");
}

-(instancetype)init {
    if (self = [super init]) {
        //创建子视图
        self.backgroundColor = LL_White;
//        [self createSubViews];
    }
    return self;
}

-(void)createSubViews {
    //左侧标题
    _titleView = [[UIView alloc] init];
    _titleView.frame = CGRectMake(0, 0, 100, cellHeight);
    CGFloat lineHeight = 14;
    CGFloat posY = (cellHeight - lineHeight)/2;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, posY, 2, lineHeight)];
    lineView.backgroundColor = LL_Green;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 80, cellHeight)];
    label.tag = 1001;
    label.font = [UIFont systemFontOfSize:16.0];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentLeft;
    [_titleView addSubview:lineView];
    [_titleView addSubview:label];
    
    //右侧视图
    _rightView = [[UIView alloc] init];
    CGFloat rightWidth = 75.0;
    _rightView.frame = CGRectMake(LL_Screen_Width-rightWidth, 0, rightWidth, cellHeight);
    UILabel *rLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 55, cellHeight)];
    rLabel.font = [UIFont systemFontOfSize:12.0];
    rLabel.textColor = [UIColor grayColor];
    rLabel.textAlignment = NSTextAlignmentLeft;
    rLabel.text = @"查看所有";
    UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right.png"]];
    CGFloat arrowHeight = 10.0;
    posY = (cellHeight - arrowHeight)/2;
    arrowImage.frame = CGRectMake(rLabel.maxOriginX, posY, arrowHeight, arrowHeight);
    [_rightView addSubview:rLabel];
    [_rightView addSubview:arrowImage];
    
    [self addSubview:_titleView];
    [self addSubview:_rightView];
}

-(void)setTitle:(NSString *)title {
    UILabel *label = [_titleView viewWithTag:1001];
    label.text = title;
}

@end
