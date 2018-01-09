//
/*****************************************
 *                                       *
 *  @dookay.com Internet make it happen  *
 *  ----------- -----------------------  *
 *  dddd  ddddd Internet make it happen  *
 *  o   o     o Internet make it happen  *
 *  k    k    k Internet make it happen  *
 *  a   a     a Internet make it happen  *
 *  yyyy  yyyyy Internet make it happen  *
 *  ----------- -----------------------  *
 *  Say hello to the future.		     *
 *  hello，未来。                   	     *
 *  未来をその手に。                        *
 *                                       *
 *****************************************/
//
//  RBNoPasteTextField.m
//  JoywayApp
//
//  Created by Riber on 2017/12/18.
//  Copyright © 2017年 dookay_73. All rights reserved.
//

#import "RBNoPasteTextField.h"

@implementation RBNoPasteTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addGesture];
    }
    
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addGesture];
    }
    
    return self;
}

- (void)addGesture {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(addGestureRecognizer:)];
    longPress.allowableMovement = 0.0f;
    longPress.minimumPressDuration = 1.0;
    [self addGestureRecognizer:longPress];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addGesture];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    if(action == @selector(paste:))//禁止粘贴
//        
//        return NO;
//    
//    if(action == @selector(select:))// 禁止选择
//        
//        return NO;
//    
//    if(action == @selector(selectAll:))// 禁止全选
//        
//        return NO;
//    if(action == @selector(cut:))// 禁止剪切
        
        return NO;

    return [super canPerformAction:action withSender:sender];
}

- (void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        gestureRecognizer.enabled = NO;
    }
    
    [super addGestureRecognizer:gestureRecognizer];
}

@end
