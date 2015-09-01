//
//  UIView+Additional.m
//  ShowMessage
//
//  Created by Heguiting on 8/18/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import "UIView+Additional.h"

@implementation UIView (Additional)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)screenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}

- (CGFloat)screenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}

- (CGFloat)screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint)offsetFromView:(UIView*)otherView {
    CGFloat x = 0, y = 0;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.left;
        y += view.top;
    }
    return CGPointMake(x, y);
}

- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}

- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
    } else {
        return nil;
    }
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (UIViewController*)viewController {
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (UIView *)firstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView firstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

-(void)resignKeyBoard{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void)resignKeyBoardInView:(UIView *)view
{
    for (UIView *aView in view.subviews) {
        if ([aView.subviews count] > 0) {
            [self resignKeyBoardInView:aView];
        }
        if ([aView isKindOfClass:[UITextView class]] || [aView isKindOfClass:[UITextField class]] ) {
            [aView resignFirstResponder];
        }
    }
}

//贝塞尔曲线 http://cubic-bezier.com/#.35,-0.22,.29,1.2
-(void)setFrame:(CGRect)frame withBezier:(Point2D *)fBezier curveWithBezier:(Point2D *)cBezier isHorizon:(BOOL)horizon timeInterval:(NSTimeInterval)interval{
    if (!fBezier) return;
    float dt;
    dt = 1.0 / (120 - 1);
    for (int i = 0; i < 120; i++) {
        Point2D point = PointOnCubicBezier(fBezier, i*dt);
        NSLog(@"X=%f,,,Y=%f",point.x,point.y);
        float durationTime = point.x * interval;
        CGRect newFrame;
        newFrame.origin.x = point.y*(frame.origin.x-self.left) + self.left;
        newFrame.origin.y = point.y*(frame.origin.y-self.top) + self.top;
        newFrame.size.width = point.y*(frame.size.width-self.width) + self.width;
        newFrame.size.height = point.y*(frame.size.height-self.height) + self.height;
        
        if (cBezier) {
            if (fBezier != cBezier) {
                point = PointOnCubicBezier(cBezier, i*dt);
            }
            if (horizon) {
                newFrame.origin.x = point.x*(frame.origin.x-self.left) + self.left;
            }else{
                newFrame.origin.y = point.x*(frame.origin.y-self.top) + self.top;
            }
        }
        [self performSelector:@selector(moveTo:) withObject:[NSValue valueWithCGRect:newFrame] afterDelay:durationTime];
    }
}

-(void)moveTo:(NSValue *)value{
    CGRect rect = value.CGRectValue;
    [self setFrame:rect];
}

@end










































