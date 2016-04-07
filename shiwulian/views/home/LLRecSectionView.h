//
//  LLRecSectionView.h
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseTableViewCell.h"


@interface LLRecSectionView : LLBaseTableViewCell

+(CGFloat)height;

@property (nonatomic, assign) NSString *title;

@end
