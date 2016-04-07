//
//  LLBaseTableViewCell.m
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLBaseTableViewCell.h"

@interface LLBaseTableViewCell ()

@property (nonatomic, strong) UIImageView *arrowImage;

@end

@implementation LLBaseTableViewCell

+(CGFloat)cellHeight {
    return 10.0;
}

-(void)awakeFromNib {
    [self customView];
}

-(instancetype)init {
    if (self = [super init]) {
        [self customView];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self customView];
    }
    return self;
}

-(void)customView {
//    self.backgroundColor = LL_Gray;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(UIImageView *)showRightArrow {
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        CGFloat arrowSize = 16.0;
        _arrowImage.frame = CGRectMake(LL_Screen_Width-10-arrowSize, 10, arrowSize, arrowSize);
        
        [self addSubview:_arrowImage];
        [self bringSubviewToFront:_arrowImage];
        
    }
    return _arrowImage;
}

@end
