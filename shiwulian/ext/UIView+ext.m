//
//  UIView+ext.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "UIView+ext.h"

@implementation UIView (frame)

-(CGFloat)frameWidth {
    return self.frame.size.width;
}

-(CGFloat)frameHeight {
    return self.frame.size.height;
}

-(void)setFrameWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setFrameHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(void)decFrameWidth:(CGFloat)size {
    CGRect frame = self.frame;
    frame.size.width -= size;
    self.frame = frame;
}

-(void)decFrameHeight:(CGFloat)size {
    CGRect frame = self.frame;
    frame.size.height -= size;
    self.frame = frame;
}

-(CGFloat)originX {
    return self.frame.origin.x;
}

-(CGFloat)originY {
    return self.frame.origin.y;
}

-(CGFloat)maxOriginX {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)maxOriginY {
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

-(void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

-(void)moveX:(CGFloat)size {
    CGRect frame = self.frame;
    frame.origin.x -= size;
    self.frame = frame;
}

-(void)moveY:(CGFloat)size {
    CGRect frame = self.frame;
    frame.origin.y -= size;
    self.frame = frame;
}

//按照scale进行大小缩放
-(void)scaleViewFrame:(CGFloat)scale {
    CGRect frame = self.frame;
    CGFloat width = frame.size.width * scale;
    CGFloat height = frame.size.height * scale;
    
    frame.origin.x += (frame.size.width - width) / 2;
    frame.origin.y += (frame.size.height - height) / 2;
    frame.size.width = width;
    frame.size.height = height;
    
    self.frame = frame;
}

-(void)scaleWidth:(CGFloat)scale {
    CGRect frame = self.frame;
    CGFloat width = frame.size.width * scale;
    frame.origin.x += (frame.size.width - width) / 2;
    frame.size.width = width;
    self.frame = frame;
}

-(void)scaleHeight:(CGFloat)scale {
    CGRect frame = self.frame;
    CGFloat height = frame.size.height * scale;
    frame.origin.y += (frame.size.height - height) / 2;
    frame.size.height = height;
    self.frame = frame;
}


-(void)onTap:(nullable SEL)action target:(nullable UIView *)view {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:view action:action];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
}

@end
