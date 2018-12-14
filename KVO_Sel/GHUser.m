//
//  GHUser.m
//  KVO_Sel
//
//  Created by 龚魁华 on 2018/12/14.
//  Copyright © 2018年 龚魁华. All rights reserved.
//

#import "GHUser.h"

@implementation GHUser
- (instancetype)init{
    self = [super init];
    if (self) {
        _dog = [[GHDog alloc] init];
    }
    return self;
}
- (NSMutableArray *)arry{
    if (!_arry) {
        _arry = [NSMutableArray array];
    }
    return _arry;
}
//是否允许自动监听属性变化 默认开启
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
//    return YES;
//}

//做属性依赖
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    NSLog(@"%@",key);
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) {
        keyPaths = [[NSSet alloc] initWithObjects:@"_dog.dogName",@"_dog.dogage",@"_dog.dogtype", nil];
    }
    return keyPaths;
}

@end
