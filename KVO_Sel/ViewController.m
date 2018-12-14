//
//  ViewController.m
//  KVO_Sel
//
//  Created by 龚魁华 on 2018/12/14.
//  Copyright © 2018年 龚魁华. All rights reserved.
//

#import "ViewController.h"
#import "GHUser.h"
#import <objc/message.h>
#import "NSObject+GHKVO.h"
@interface ViewController ()
@property (strong, nonatomic) GHUser *user;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _user = [[GHUser alloc] init];
//    _user = [GHUser alloc];
//    _user = objc_msgSend(_user,@selector(init));
    /*参数
     *_user 观察那个对象
     *self 谁来观察
     *NSStringFromSelector(@selector(userName)) 观察对象的那个属性，是个字符串，防止写错字符串，不被提示，我这样写的，写@“userName”也是可以的，记，这个名字一定不能错，错了就不能监听了
     options 这个是监听接受设置
     是个枚举NSKeyValueObservingOptionNew 直接收新变化的数据
     NSKeyValueObservingOptionOld 接受发通知的上个值
     NSKeyValueObservingOptionInitial 不接受值的变化
     NSKeyValueObservingOptionPrior
     */
    [_user addObserver:self forKeyPath:@"dog.dogName" options:NSKeyValueObservingOptionNew context:nil];
//    [_user Gh_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    [_user addObserver:self forKeyPath:@"arry" options:NSKeyValueObservingOptionNew context:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}

- (void)GH_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int a;
    //开始调用kvo
//    _user.name = [NSString stringWithFormat:@"%d",a++];
//    NSMutableArray *temp = [_user mutableArrayValueForKey:@"arry"];
//    [temp addObject:@"123123"];
    _user.dog.dogName = [NSString stringWithFormat:@"%d",a++];
     _user.dog.dogage = [NSString stringWithFormat:@"%d",a++];
     _user.dog.dogtype = [NSString stringWithFormat:@"%d",a++];
}


@end
