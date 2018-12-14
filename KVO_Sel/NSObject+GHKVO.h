//
//  NSObject+GHKVO.h
//  KVO_Sel
//
//  Created by 龚魁华 on 2018/12/14.
//  Copyright © 2018年 龚魁华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GHKVO)
- (void)Gh_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
@end
