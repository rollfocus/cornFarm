//
//  LLRecProductCell.m
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLRecProductCell.h"

@implementation LLRecProductCell

+(CGFloat)cellHeight {
    return 220.0;
}

-(void)awakeFromNib {
//    [super awakeFromNib];
    
    NSLog(@">>>>>>>>>>> use xib??");
    
    self.backgroundColor = LL_Gray;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

-(instancetype)init {
    if (self = [super init]) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews {
    self.backgroundColor = LL_Gray;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    UIView *backView = [[UIView alloc] initWithFrame:self.frame];
//    backView.frame = CGRectMake(0, 0, LL_Screen_Width, [LLRecProductCell cellHeight] - 8);
//    backView.backgroundColor = LL_White;
//    [self addSubview:backView];
    
}


@end
