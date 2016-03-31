//
//  DMJson.h
//  duomi
//
//  Created by wj on 14-7-21.
//  Copyright (c) 2014年 duomi.com All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DMJson : NSObject<NSCopying>
{
    id json;
}

@property (nonatomic, retain) id json;

/**
 *  JSON数组
 *
 *  @return
 */
+ (DMJson *)jsonWithArray;

/**
 *  JSON字典
 *
 *  @return
 */
+ (DMJson *)jsonWithDictionary;

/**
 *  JSON数组或字典
 *
 *  @param object 数组或字典
 *
 *  @return
 */
+ (DMJson *)jsonWithObject:(id)object;

/**
 *  通过JSON字符串转换成实例
 *
 *  @param jsonString JSON字符串
 *
 *  @return
 */
+ (DMJson *)jsonWithJsonString:(NSString *)jsonString;

/**
 *  转换成JSON字符串
 *
 *  @return
 */
- (NSString *)toJsonString;

/**
 *  字符串
 *
 *  @return
 */
- (NSString *)toString;

/**
 *  打印JSON
 */
- (void)printJson;

/**
 *  元素个数
 *
 *  @return
 */
- (NSUInteger)count;

@end

/**
 *  JSON字典
 */
@interface DMJson (Dictionary)

- (DMJson *)getJsonForKey:(NSString *)key;
- (BOOL)hasValueForKey:(NSString *)key;

- (NSString *)getStringForKey:(NSString *)key;
- (BOOL)getBoolForKey:(NSString *)key;
- (NSInteger)getIntForKey:(NSString *)key;
- (long long)getLongLongForKey:(NSString *)key;
- (CGFloat)getFloatForKey:(NSString *)key;
- (double)getDoubleForKey:(NSString *)key;
- (id)getObjectForKey:(NSString *)key;

@end

/**
 *  JSON数组
 */
@interface DMJson (Array)

- (DMJson *)getJsonForIndex:(NSInteger)index;
- (DMJson *)getLastJson;
- (NSString *)getStringForIndex:(NSInteger)index;
- (BOOL)getBoolForIndex:(NSInteger)index;
- (NSInteger)getIntForIndex:(NSInteger)index;
- (long long)getLongLongForIndex:(NSInteger)index;
- (CGFloat)getFloatForIndex:(NSInteger)index;
- (double)getDoubleForIndex:(NSInteger)index;
- (id)getObjectForIndex:(NSInteger)index;

@end
