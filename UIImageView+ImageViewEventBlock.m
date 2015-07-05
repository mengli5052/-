//
//  UIImageView+ImageViewEventBlock.m
//  自定义控件
//
//  Created by LZXuan on 15-6-2.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "UIImageView+ImageViewEventBlock.h"

#import <objc/runtime.h>

@interface UIImageView ()

@property (nonatomic,copy) ImageViewBlock myBlock;
@end

//如果 匿名类别写在了 类别实现部分得上方，里面的出现@property之后 编译器是不会对应自动添加@synthesize

@implementation UIImageView (ImageViewEventBlock)
//类别中不允许 写@synthesize 所以编译器 在这里没有添加下面的话 所以这里没有自动实现 setter和getter
//@synthesize myBlock = _myBlock;
/*
 如果已给一个系统类增加类别不能增加成员变量
 并且也不能在系统类的匿名类别中增加成员变量否则编译的会报错，报错如下
 Undefined symbols for architecture x86_64:
 "_OBJC_IVAR_$_UIImageView._myBlock", referenced from:
 -[UIImageView(ImageViewEventBlock) setMyBlock:]
 //这时 如果我们要想给系统类增加 成员变量 必须使用运行时
 
- (void)setMyBlock:(ImageViewBlock)myBlock {
    if (_myBlock != myBlock) {
        [_myBlock release];
        _myBlock = [myBlock retain];
    }
}
- (ImageViewBlock )myBlock {
    return _myBlock;
}
 */
- (void)setMyBlock:(ImageViewBlock)myBlock {
    //使用运行时的setter方法
    //第一个参数 就是给哪个对象的属性赋值
    //第二个参数 写 属性名字符串 C语言的
    // 3       给属性 赋的值
    // 4   哪种形式的赋值 强引用(copy/retain)/弱引用/
    objc_setAssociatedObject(self, "myBlock", myBlock, OBJC_ASSOCIATION_COPY);
}
- (ImageViewBlock)myBlock {
    //使用运行时 调用getter
    return objc_getAssociatedObject(self, "myBlock");
}


- (void)addClickEvent:(ImageViewBlock)block {
    //打开用户交互
    self.userInteractionEnabled = YES;
    self.myBlock = block;
}
//给当前类 增加一个UITouch
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //一旦手指触摸屏幕 手指离开的时候会触发
    if (self.myBlock) {
        //调用block
        self.myBlock(self);
    }
}


@end



