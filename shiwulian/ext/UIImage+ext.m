//
//  UIImage+ext.m
//  shiwulian
//
//  Created by lin zoup on 3/22/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "UIImage+ext.h"
#import "SDImageCache.h"

@implementation UIImage (tint)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

-(UIImage *)imageWithGradientTintColor:(UIColor *)tintColor {
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

- (UIImage *)fillWithColor:(UIColor *)color withSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    //Draw the tinted image in context
    [self drawInRect:CGRectMake((rect.size.width-self.size.width)/2.0f,
                                (rect.size.height-self.size.height)/2.0f,
                                self.size.width, self.size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)fillImageWithName:(NSString *)imgName withColor:(UIColor *)color withSize:(CGSize)size
{
    //读取缓存 若失败加载处理
    NSString *key = [NSString stringWithFormat:@"%@_c%@_s%@", imgName, [color description], NSStringFromCGSize(size)];
    UIImage *img = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:key];
    if (img) {
        return img;
    }
    img = [UIImage imageNamed:imgName];
    img = [img fillWithColor:color withSize:size];
    [[SDImageCache sharedImageCache] storeImage:img forKey:key toDisk:NO];
    
    return img;
}


@end
