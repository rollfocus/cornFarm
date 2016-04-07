//
//  LLDynHeadCell.h
//  shiwulian
//
//  Created by lin zoup on 4/5/16.
//  Copyright (c) 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseTableViewCell.h"

@protocol DynSecSwitchDelegate <NSObject>

@required  -(void)swicthDyn:(BOOL)isMine;

@end

@interface LLDynHeadCell : LLBaseTableViewCell <DynSecSwitchDelegate>
@property (weak, nonatomic) IBOutlet UIView *tabBgView;
@property (weak, nonatomic) IBOutlet UILabel *hotLabel;
@property (weak, nonatomic) IBOutlet UILabel *mineLabel;

@property (nonatomic, assign) BOOL isMine;

@property (nonatomic, assign) id<DynSecSwitchDelegate> delegate;

@end
