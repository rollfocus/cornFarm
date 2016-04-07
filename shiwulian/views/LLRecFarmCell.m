//
//  LLRecFarmCell.m
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLRecFarmCell.h"

@interface LLRecFarmCell ()

@end


@implementation LLRecFarmCell

+(CGFloat)cellHeight {
    return 200.0;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    //模拟数据
    NSString *jsonStr = @"{\"name\": \"admin\",\"list\": [\"one\",\"two\",\"three\"], \
           \"level\":5}";
    self.jsonData = [DMJson jsonWithJsonString:jsonStr];
}

-(void)setJsonData:(DMJson *)jsonData {
    //设置等级
    
    NSInteger level = 3;
    level = [jsonData getIntForKey:@"level"];
    for (NSInteger i = 0; i < level; i++) {
        UIImageView *levelImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"level.png"] highlightedImage:nil];
        levelImage.frame = CGRectMake(16*i, 2, 14, 14);
        [_levelView addSubview:levelImage];
    }
    _levelView.backgroundColor = [UIColor clearColor];
    
    //设置认证图标
    UIImageView *cupImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cup.png"]];
    cupImage.frame = CGRectMake(0, 5, 14, 14);
    UIImageView *shieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shield.png"]];
    shieldImage.frame = CGRectMake(18, 5, 14, 14);
    [_certView addSubview:cupImage];
    [_certView addSubview:shieldImage];
    _certView.backgroundColor = [UIColor clearColor];
    
    //设置
    _tagInfoView.backgroundColor = LL_Green_Bg;
    _tagInfoView.layer.cornerRadius = 2.0f;
    _tagInfoView.text = @"草地，绵羊，野鸡";
    _tagInfoView.backgroundColor = [UIColor clearColor];
    
}

@end
