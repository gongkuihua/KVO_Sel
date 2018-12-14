//
//  NSObject+GHKVO.m
//  KVO_Sel
//
//  Created by 龚魁华 on 2018/12/14.
//  Copyright © 2018年 龚魁华. All rights reserved.
//

#import "NSObject+GHKVO.h"
#import <objc/message.h>
@implementation NSObject (GHKVO)
- (void)Gh_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    //1.创建一个类
    NSString *oldClassName = NSStringFromClass(self.class);
    NSString *newClassName = [@"GHKVO" stringByAppendingString:oldClassName];
    Class MyClass = objc_allocateClassPair(self.class, newClassName.UTF8String, 0);
    
    //注册类
    objc_registerClassPair(MyClass);
    
    //2.重写setName方法
    /*MyClass 给那个类添加方法
     *@selector(setName:) 方法标示
     *(IMP)setName 方法地址
     *"v@:@" 返回值类型，v是void  :表示一个selector(sel)方法编号 @表示一个id类型的对象 就是参数
     
     */
    class_addMethod(MyClass, @selector(setName:), (IMP)setName,"v@:@");
    
    //3.修改isa指针
    object_setClass(self, MyClass);
    
    //4将观察者保存当前对象
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, @"context", CFBridgingRelease(context), OBJC_ASSOCIATION_ASSIGN);
}

void setName(id self,SEL _cmd,NSString *newName){
    //调用父类的setName方法
    Class class = [self class];
    object_setClass(self, class_getSuperclass(class));//将子类变为父类
    objc_msgSend(self,@selector(setName:),newName);//调用父类
    
    id observer = objc_getAssociatedObject(self, @"observer");
    id context = objc_getAssociatedObject(self, @"context");
    if (observer) {
        objc_msgSend(observer, @selector(GH_observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"new":newName,@"kind":@1},context);
    }
    //改回子类
    object_setClass(self, class);
    NSLog(@"来了");
}
@end
