//
//  UIView+Layout.m
//  Cadenza-ScoreDraw
//
//  Created by Travis Henspeter on 3/23/15.
//  Copyright (c) 2015 Sonation. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

+ (NSLayoutAttribute)axisAttribute:(LayoutAxis)axis
{
    switch (axis) {
        case LayoutAxis_Horizontal:
            return NSLayoutAttributeCenterX;
            break;
            
        default:
            return NSLayoutAttributeCenterY;
            break;
    }
}

+ (NSLayoutAttribute)edgeAttribute:(LayoutEdge)edge
{
    switch (edge) {
        case LayoutEdge_Top: {
            return NSLayoutAttributeTop;
            break;
        }
        case LayoutEdge_Right: {
            return NSLayoutAttributeRight;
            break;
        }
        case LayoutEdge_Bottom: {
            return NSLayoutAttributeBottom;
            break;
        }
        case LayoutEdge_Left: {
            return NSLayoutAttributeLeft;
            break;
        }
        default: {
            return NSLayoutAttributeNotAnAttribute;
            break;
        }
    }
}

- (NSLayoutConstraint *)alignAxis:(LayoutAxis)axis1 toAxis:(LayoutAxis)axis2 ofView:(UIView *)view offset:(CGFloat)offset
{
    if (!view) {
        return nil;
    }
    
    NSLayoutAttribute attr1 = [UIView axisAttribute:axis1];
    NSLayoutAttribute attr2 = [UIView axisAttribute:axis2];
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:attr1
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:attr2
                                             multiplier:1.0
                                               constant:offset];
    
    return constraint;
}

- (NSLayoutConstraint *)pinHeight:(CGFloat)height
{
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:1.0
                                               constant:height];
    
    return constraint;
}

- (NSLayoutConstraint *)pinWidth:(CGFloat)width
{
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:1.0
                                               constant:width];
    
    return constraint;
}

- (NSLayoutConstraint *)alignCenterXToSuperOffset:(CGFloat)offset
{
    if (!self.superview) {
        return nil;
    }
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.superview
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0
                                               constant:offset];
    
    return constraint;
    
}

- (NSLayoutConstraint *)alignCenterYToSuperOffset:(CGFloat)offset
{
    if (!self.superview) {
        return nil;
    }
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeCenterY
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.superview
                                              attribute:NSLayoutAttributeCenterY
                                             multiplier:1.0
                                               constant:offset];
    
    return constraint;
    
}

- (NSLayoutConstraint *)pinWidthEqualToHeight
{
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1.0
                                               constant:0.0];
    
    return constraint;
}

- (NSLayoutConstraint *)pinHeightProportionateToSuperview:(CGFloat)proportion
{
    if (!self.superview) {
        return nil;
    }
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.superview
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:proportion
                                               constant:0.0];
    
    return constraint;
}

- (NSLayoutConstraint *)pinWidthInProportion:(CGFloat)proportion toWidthOfView:(UIView *)view
{
    if (!view) {
        return nil;
    }
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:proportion
                                               constant:0.0];
    
    return constraint;
    
}

- (NSLayoutConstraint *)pinHeightInProportion:(CGFloat)proportion toHeightOfView:(UIView *)view
{
    if (!view) {
        return nil;
    }
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:proportion
                                               constant:0.0];
    
    return constraint;
}

- (NSLayoutConstraint *)pinWidthProportionateToSuperview:(CGFloat)proportion
{
    if (!self.superview) {
        return nil;
    }
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.superview
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:proportion
                                               constant:0.0];
    
    return constraint;
}

- (NSLayoutConstraint *)pinWidthEqualToView:(UIView *)view
{
    if (!view) {
        return nil;
    }
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0
                                               constant:0.0];
    return constraint;
}

- (NSLayoutConstraint *)pinHeightEqualToView:(UIView *)view
{
    if (!view) {
        return nil;
    }
    
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1.0
                                               constant:0.0];
    return constraint;
}

- (NSLayoutConstraint *)pinEdge:(LayoutEdge)edge toSuperviewEdge:(LayoutEdge)superviewEdge
{
    NSLayoutConstraint *constraint = nil;
    
    if (!self.superview) {
        return constraint;
    }
    
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:[UIView edgeAttribute:edge]
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.superview
                                              attribute:[UIView edgeAttribute:superviewEdge]
                                             multiplier:1.0
                                               constant:0.0];
    
    return constraint;
}

- (NSLayoutConstraint *)pinMinWidth:(CGFloat)minWidth
{
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:1.0
                                               constant:minWidth];
    
    return constraint;
}

- (NSLayoutConstraint *)pinMaxWidth:(CGFloat)maxWidth
{
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationLessThanOrEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:1.0
                                               constant:maxWidth];
    
    return constraint;
}


- (NSLayoutConstraint *)pinEdge:(LayoutEdge)edge1 toEdge:(LayoutEdge)edge2 ofView:(UIView *)view withInset:(CGFloat)inset
{
    NSLayoutConstraint *constraint = nil;
    if (!view) {
        return constraint;
    }
    
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:[UIView edgeAttribute:edge1]
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:[UIView edgeAttribute:edge2]
                                             multiplier:1.0
                                               constant:inset];
    return constraint;
    
}


- (NSArray *)pinEdgesToSuperWithInsets:(UIEdgeInsets)insets
{
    if (!self.superview) {
        return nil;
    }
    
    NSMutableArray *temp = [NSMutableArray array];
    [temp addObject:[self pinEdge:LayoutEdge_Top toEdge:LayoutEdge_Top ofView:self.superview withInset:insets.top]];
    [temp addObject:[self pinEdge:LayoutEdge_Right toEdge:LayoutEdge_Right ofView:self.superview withInset:insets.right]];
    [temp addObject:[self pinEdge:LayoutEdge_Bottom toEdge:LayoutEdge_Bottom ofView:self.superview withInset:insets.bottom]];
    [temp addObject:[self pinEdge:LayoutEdge_Left toEdge:LayoutEdge_Left ofView:self.superview withInset:insets.left]];
    
    return [NSArray arrayWithArray:temp];
}


@end
