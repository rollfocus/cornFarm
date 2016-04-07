//
//  LLBaseTableViewCell.m
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLBaseTableViewCell.h"

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


@end
