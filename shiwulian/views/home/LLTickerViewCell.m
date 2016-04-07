//
//  LLTickerViewCell.m
//  shiwulian
//
//  Created by lin zoup on 3/29/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLTickerViewCell.h"
#import "LLDefine.h"

@interface LLTickerViewCell ()

@property (nonatomic, strong) UIImageView *image;

@end

@implementation LLTickerViewCell

+(CGFloat)cellHeight {
    return 225.0 * LL_Scale_iPhone6_375;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews {
    _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ticker.jpg"]];
    [self addSubview:_image];
}

-(void)layoutSubviews {
    _image.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight - 8);
}

@end
