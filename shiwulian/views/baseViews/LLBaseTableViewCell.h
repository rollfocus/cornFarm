//
//  LLBaseTableViewCell.h
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LLBaseTableViewCell : UITableViewCell

@property (nonatomic, assign) DMJson *jsonData;

+(CGFloat)cellHeight;

@end
