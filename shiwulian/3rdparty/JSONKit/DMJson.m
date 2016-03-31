//
//  DMJson.m
//  duomi
//
//  Created by wj on 14-7-21.
//  Copyright (c) 2014年 duomi.com All rights reserved.
//

#import "DMJson.h"
#import "JSONKit.h"

@implementation DMJson
@synthesize json = _json;

+ (DMJson *)jsonWithArray
{
    return [self.class jsonWithObject:[NSMutableArray array]];
}

+ (DMJson *)jsonWithDictionary
{
    return [self.class jsonWithObject:[NSMutableDictionary dictionary]];
}

+ (DMJson *)jsonWithObject:(id)object
{
    DMJson *jsonObj = [[[DMJson alloc] init] autorelease];
    if ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSArray class]]) {
        jsonObj.json = object;
    }
    return jsonObj;
}

+ (DMJson *)jsonWithJsonString:(NSString *)jsonString
{
    return [self.class jsonWithObject:[jsonString mutableObjectFromJSONStringLF]];
}

- (id)copyWithZone:(NSZone *)zone
{
    DMJson *jsonObj = [[self.class allocWithZone:zone] init];
    jsonObj.json = self.json;
    return jsonObj;
}

- (void)dealloc
{
    [_json release];
    [super dealloc];
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[DMJson class]]) {
        return [self.json isEqual:[object json]];
    }
    
    return NO;
}

- (NSUInteger)hash
{
    return [_json hash];
}

- (NSString *)description
{
    return [_json description];
}

- (NSString *)toJsonString
{
    return [_json JSONStringLF];
}

- (NSString *)toString
{
    return [_json toString];
}

- (void)printJson
{
    NSLog(@"json is :\r\n %@", _json);
}

- (NSUInteger)count
{
    NSUInteger ret = 0;
    if ([_json respondsToSelector:@selector(count)]) {
        ret = [_json count];
    }
    
    return ret;
}

@end

@implementation DMJson (Dictionary)

- (BOOL)hasValueForKey:(NSString *)key
{
    id retObj = nil;
    if (key && [_json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)_json;
        retObj = [dict objectForKey:key];
    }
    return retObj != nil;
}

- (DMJson *)getJsonForKey:(NSString *)key
{
    id retObj = nil;
    if (key && [_json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)_json;
        retObj = [dict objectForKey:key];
    }
    
    if (retObj == nil) {
        retObj = [NSDictionary dictionary];
    }
    
    return [DMJson jsonWithObject:retObj];
}

- (NSString *)getStringForKey:(NSString *)key
{
    id retObj = @"";
    if (key && [_json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)_json;
        retObj = [dict objectForKey:key];
        
        if ([retObj isKindOfClass:[NSNumber class]]) {
            retObj = [retObj stringValue];
        }
        
        if (![retObj isKindOfClass:[NSString class]]) {
            retObj = @"";
        }
    }
    
    return retObj;
}

- (NSInteger)getIntForKey:(NSString *)key
{
    return [[self getStringForKey:key] integerValue];
}

- (long long)getLongLongForKey:(NSString *)key
{
    return [[self getStringForKey:key] longLongValue];
}

- (BOOL)getBoolForKey:(NSString *)key
{
    return [[self getStringForKey:key] boolValue];
}

- (CGFloat)getFloatForKey:(NSString *)key
{
    return [[self getStringForKey:key] floatValue];
}

- (double)getDoubleForKey:(NSString *)key
{
    return [[self getStringForKey:key] doubleValue];
}

- (id)getObjectForKey:(NSString *)key
{
    id retObj = nil;
    if (key && [_json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)_json;
        retObj = [dict objectForKey:key];
    }
    
    return retObj;
}

@end

@implementation DMJson (Array)

- (DMJson *)getJsonForIndex:(NSInteger)index
{
    id retObj = nil;
    if ([_json isKindOfClass:[NSArray class]]) {
        NSArray *array = (NSArray *)_json;
        if ([array count] > index && index >= 0) {
            retObj = [array objectAtIndex:index];
        }
    }
    
    if (retObj == nil) {
        retObj = [NSArray array];
    }
    
    return [DMJson jsonWithObject:retObj];
}

- (DMJson *)getLastJson
{
    id retObj = nil;
    if ([_json isKindOfClass:[NSArray class]]) {
        NSArray *array = (NSArray *)_json;
        if ([array count]) {
            retObj = [array lastObject];
        }
    }
    
    if (retObj == nil) {
        retObj = [NSArray array];
    }
    
    return [DMJson jsonWithObject:retObj];
}

- (NSString *)getStringForIndex:(NSInteger)index
{
    id retObj = @"";
    if ([_json isKindOfClass:[NSArray class]]) {
        NSArray *array = (NSArray *)_json;
        if ([array count] > index && index >= 0) {
            retObj = [array objectAtIndex:index];
        }
        
        if ([retObj isKindOfClass:[NSNumber class]]) {
            retObj = [retObj stringValue];
        }
        
        if (![retObj isKindOfClass:[NSString class]]) {
            retObj = @"";
        }
    }
    
    return retObj;
}

- (BOOL)getBoolForIndex:(NSInteger)index
{
    return [[self getStringForIndex:index] boolValue];
}

- (NSInteger)getIntForIndex:(NSInteger)index
{
    return [[self getStringForIndex:index] integerValue];
}

- (long long)getLongLongForIndex:(NSInteger)index
{
    return [[self getStringForIndex:index] longLongValue];
}

- (CGFloat)getFloatForIndex:(NSInteger)index
{
    return [[self getStringForIndex:index] floatValue];
}

- (double)getDoubleForIndex:(NSInteger)index
{
    return [[self getStringForIndex:index] doubleValue];
}

- (id)getObjectForIndex:(NSInteger)index
{
    if ([_json isKindOfClass:[NSArray class]]) {
        NSArray *array = (NSArray *)_json;
        if ([array count] > index && index >= 0) {
            return [array objectAtIndex:index];
        }
    }
    
    return nil;
}

@end
