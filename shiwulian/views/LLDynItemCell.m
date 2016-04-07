//
//  LLDynItemCell.m
//  shiwulian
//
//  Created by lin zoup on 4/5/16.
//  Copyright (c) 2016 shiwulian. All rights reserved.
//

#import "LLDynItemCell.h"

@interface LLDynItemCell () {
    NSString *dynMsg;
    BOOL hasPic;
    
}

@end

@implementation LLDynItemCell

+(CGFloat)cellHeight {
    return 400.0;
}

+(CGFloat)cellHeightWithJson:(DMJson *)jsonData {
    //计算各个文本内容来获取高度
    return 500.0;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.jsonData = nil;
    
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    _dynMsgBgView.backgroundColor = [UIColor clearColor];
    _commentBgView.backgroundColor = [UIColor clearColor];
    
    _productBgView.backgroundColor = LL_Gray;
    _productBgView.layer.cornerRadius = 6.0;
    //允许图像裁剪
    _userImageView.layer.masksToBounds = YES;

    [self setNeedsLayout];
    
    [self addData];
}

-(void)addData {
    CGFloat width = LL_Screen_Width - 30;
    CGFloat height = 80;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    textLabel.text = @"这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，\
    这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，\
    这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，\
    这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息，这里是描述信息";
    //自动换行
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:14.0];
    [_dynMsgBgView addSubview:textLabel];
    
    //查找label库简化工作
    //添加评论
    CGFloat moveY = 5;
    UILabel *commentL0 = [[UILabel alloc] initWithFrame:CGRectMake(5, 28+moveY, width-5, 30)];
    commentL0.text = @"哈哈：我是第一个评论，我是第一个评论，真的是第一个评论该，请求显示，请求显示";
    commentL0.numberOfLines = 0;
    commentL0.font = [UIFont systemFontOfSize:12.0];
    [_commentBgView addSubview:commentL0];
    
    commentL0 = [[UILabel alloc] initWithFrame:CGRectMake(5, 62+moveY, width-5, 14)];
    commentL0.text = @"小白：这是单行评论";
    commentL0.numberOfLines = 0;
    commentL0.font = [UIFont systemFontOfSize:12.0];
    [_commentBgView addSubview:commentL0];
    
    commentL0 = [[UILabel alloc] initWithFrame:CGRectMake(5, 82+moveY, width-5, 14)];
    commentL0.text = @"晋小二：多添加几条评论该";
    commentL0.numberOfLines = 0;
    commentL0.font = [UIFont systemFontOfSize:12.0];
    [_commentBgView addSubview:commentL0];
    
    commentL0 = [[UILabel alloc] initWithFrame:CGRectMake(5, 102+moveY, width-5, 14)];
    commentL0.text = @"小俊俊：我也来一脚看大家玩儿";
    commentL0.numberOfLines = 0;
    commentL0.font = [UIFont systemFontOfSize:12.0];
    [_commentBgView addSubview:commentL0];

    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews {
    _bgView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight-10);
    
    CGFloat posX, posY, width, height;
    posX = 10;
    posY = 10;
    width = 60.0;
    _userImageView.frame = CGRectMake(posX, posY, width, width);
    _userImageView.layer.cornerRadius = width/2.0;
    
    posX = _userImageView.maxOriginX + 6;
    _userName.frame = CGRectMake(posX, posY+10, 200.0, 16.0);
    posY = _userName.maxOriginY + 8;
    _timeLabel.frame = CGRectMake(posX, posY, 100.0, 14.0);
    
    posX = 10.0;
    width = LL_Screen_Width - posX*2;
    
    posY = _userImageView.maxOriginY + 10;
    height = 80.0;
    _dynMsgBgView.frame = CGRectMake(posX, posY, width, height);
    
    //动态消息视图添加图文信息
    posY = _dynMsgBgView.maxOriginY + 8;
    height = 60.0;
    _productBgView.frame = CGRectMake(posX, posY, width, height);
    CGFloat pWidth, pHeight;
    pHeight = 45.0;
    _productImageView.frame = CGRectMake(10, (height-pHeight)/2, pHeight, pHeight);
    pWidth = 200.0;
    pHeight = 20.0;
    _productName.frame = CGRectMake(_productImageView.maxOriginX+6, (height-pHeight)/2,
                                    pWidth, pHeight);
    
    posY = _productBgView.maxOriginY + 12;
    height = 140.0;
    _commentBgView.frame = CGRectMake(posX, posY, width, height);
    width =25.0;
    _likeIconView.frame = CGRectMake(0, 0, width, width);
    _commentIconView.frame = _likeIconView.frame;
    width = 100.0;
    height = 15.0;
    CGFloat moveP = 4;
    _likeNum.frame = CGRectMake(_likeIconView.maxOriginX + 4, moveP, width, height);
    _commentNum.frame = _likeNum.frame;
    _likeIconView.originY -= 1;
    _likeNum.originX -= 2;
    _commentIconView.originX = _commentBgView.frameWidth - 60.0;
    _commentIconView.originY += moveP;
    _commentIconView.frameWidth = 20;
    _commentIconView.frameHeight = 18;
    _commentNum.originX = _commentIconView.maxOriginX + 5;
    
}

@end
