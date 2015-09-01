//
//  UIView+Additional.h
//  ShowMessage
//
//  Created by Heguiting on 8/18/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJDBezierCurve.h"

@interface UIView (Additional)

/**
 *  返回／设定 view的坐标
 */
@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;
@property(nonatomic,readonly) CGFloat screenX;
@property(nonatomic,readonly) CGFloat screenY;
@property(nonatomic,readonly) CGFloat screenViewX;
@property(nonatomic,readonly) CGFloat screenViewY;
@property(nonatomic,readonly) CGRect screenFrame;

/**
 * 遍历自己和自己的subviews，找到第一个属于某个class的view返回
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * 遍历自己和自己的superViews，找到第一个属于某个class的view返回
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * 删除所有subview
 */
- (void)removeAllSubviews;

/**
 * 返回相对于otherview的偏移量
 */
- (CGPoint)offsetFromView:(UIView*)otherView;

/**
 * 返回自己的视图控制器
 */
- (UIViewController*)viewController;

/**
 * 返回第一响应者
 */
- (UIView *)firstResponder;

/**
 * 回收软键盘
 */
-(void)resignKeyBoard;

/**
 *  用贝塞尔曲线设置view走位
 */
-(void)setFrame:(CGRect)frame withBezier:(Point2D *)fBezier curveWithBezier:(Point2D *)cBezier isHorizon:(BOOL)horizon timeInterval:(NSTimeInterval)interval;

@end


























