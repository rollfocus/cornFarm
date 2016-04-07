//
//  UIView+ext.h
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)

//大小处理
-(CGFloat)frameWidth;
-(CGFloat)frameHeight;
-(void)setFrameWidth:(CGFloat)width;
-(void)setFrameHeight:(CGFloat)height;
-(void)decFrameWidth:(CGFloat)size;
-(void)decFrameHeight:(CGFloat)size;

-(CGFloat)originX;
-(CGFloat)originY;
-(CGFloat)maxOriginX;
-(CGFloat)maxOriginY;
-(void)setOriginX:(CGFloat)originX;
-(void)setOriginY:(CGFloat)originY;
-(void)moveX:(CGFloat)size;
-(void)moveY:(CGFloat)size;

-(void)scaleViewFrame:(CGFloat)scale;
-(void)scaleWidth:(CGFloat)scale;
-(void)scaleHeight:(CGFloat)scale;


//手势处理
-(void)onTap:(nullable UIView *)view action:(nullable SEL)action;


@end
