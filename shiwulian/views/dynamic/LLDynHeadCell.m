//
//  LLDynHeadCell.m
//  shiwulian
//
//  Created by lin zoup on 4/5/16.
//  Copyright (c) 2016 shiwulian. All rights reserved.
//

#import "LLDynHeadCell.h"

@implementation LLDynHeadCell

+(CGFloat)cellHeight {
    return 80.0;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    _tabBgView.backgroundColor = [UIColor clearColor];
    _tabBgView.clipsToBounds = YES;
    _tabBgView.layer.cornerRadius = 5.0;
    _tabBgView.layer.borderWidth = 1.0;
    _tabBgView.layer.borderColor = [UIColor orangeColor].CGColor;
    
    _hotLabel.backgroundColor = [UIColor orangeColor];
    _mineLabel.backgroundColor = [UIColor whiteColor];
 
    _hotLabel.userInteractionEnabled = YES;
    _mineLabel.userInteractionEnabled = YES;
    [_hotLabel onTap:self action:@selector(switchHot)];
    [_mineLabel onTap:self action:@selector(switchMine)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)switchHot {
    if (_isMine) {
//        _isMine = NO;
        self.isMine = NO;
    }
}

-(void)switchMine {
    if (!_isMine) {
//        _isMine = YES;
        self.isMine = YES;
    }
}

-(void)setIsMine:(BOOL)isMine {
    //切换可以添加动画效果
    if (isMine) {
        _hotLabel.backgroundColor = [UIColor whiteColor];
        _mineLabel.backgroundColor = [UIColor orangeColor];
    } else {
        _hotLabel.backgroundColor = [UIColor orangeColor];
        _mineLabel.backgroundColor = [UIColor whiteColor];
    }
    
    //切换父视图的内容
    if ([_delegate respondsToSelector:@selector(swicthDyn:)]) {
        [_delegate swicthDyn:isMine];
    }
    _isMine = isMine;
}

@end
