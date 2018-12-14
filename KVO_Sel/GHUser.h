//
//  GHUser.h
//  KVO_Sel
//
//  Created by 龚魁华 on 2018/12/14.
//  Copyright © 2018年 龚魁华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHDog.h"
@interface GHUser : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) GHDog *dog;
@property (strong, nonatomic) NSMutableArray *arry;
@end
