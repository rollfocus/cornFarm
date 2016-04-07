//
//  LLDynItemCell.h
//  shiwulian
//
//  Created by lin zoup on 4/5/16.
//  Copyright (c) 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseTableViewCell.h"

@interface LLDynItemCell : LLBaseTableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIView *dynMsgBgView;
@property (weak, nonatomic) IBOutlet UIView *productBgView;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;

@property (weak, nonatomic) IBOutlet UIView *commentBgView;
@property (weak, nonatomic) IBOutlet UIImageView *likeIconView;
@property (weak, nonatomic) IBOutlet UILabel *likeNum;
@property (weak, nonatomic) IBOutlet UIImageView *commentIconView;
@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@end
