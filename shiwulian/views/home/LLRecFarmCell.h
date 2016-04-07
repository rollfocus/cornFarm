//
//  LLRecFarmCell.h
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLBaseTableViewCell.h"


@interface LLRecFarmCell : LLBaseTableViewCell

@property (weak, nonatomic) IBOutlet UIView *levelView;
@property (weak, nonatomic) IBOutlet UIView *certView;
@property (weak, nonatomic) IBOutlet UILabel *tagInfoView;


@end
