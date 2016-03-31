//
//  UIImage+ext.h
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (tint)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

+ (UIImage *)fillImageWithName:(NSString *)imgName withColor:(UIColor *)color withSize:(CGSize)size;

@end
