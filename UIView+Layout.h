//
//  UIView+Layout.h
//  Cadenza-ScoreDraw
//
//  Created by Travis Henspeter on 3/23/15.
//  Copyright (c) 2015 Sonation. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LayoutEdge)
{
    LayoutEdge_Top,
    LayoutEdge_Right,
    LayoutEdge_Bottom,
    LayoutEdge_Left
};

typedef NS_ENUM(NSInteger, LayoutAxis)
{
    LayoutAxis_Horizontal,
    LayoutAxis_Vertical
};

@interface UIView (Layout)

- (NSLayoutConstraint *)alignCenterYToSuperOffset:(CGFloat)offset;

- (NSLayoutConstraint *)alignCenterXToSuperOffset:(CGFloat)offset;

- (NSLayoutConstraint *)alignAxis:(LayoutAxis)axis1 toAxis:(LayoutAxis)axis2 ofView:(UIView *)view offset:(CGFloat)offset;

- (NSLayoutConstraint *)pinWidthEqualToHeight;

- (NSLayoutConstraint *)pinHeight:(CGFloat)height;

- (NSLayoutConstraint *)pinWidth:(CGFloat)width;

- (NSLayoutConstraint *)pinMinWidth:(CGFloat)minWidth;

- (NSLayoutConstraint *)pinMaxWidth:(CGFloat)maxWidth;

- (NSLayoutConstraint *)pinHeightProportionateToSuperview:(CGFloat)proportion;

- (NSLayoutConstraint *)pinWidthProportionateToSuperview:(CGFloat)proportion;

- (NSLayoutConstraint *)pinWidthInProportion:(CGFloat)proportion toWidthOfView:(UIView *)view;

- (NSLayoutConstraint *)pinHeightInProportion:(CGFloat)proportion toHeightOfView:(UIView *)view;

- (NSLayoutConstraint *)pinWidthEqualToView:(UIView *)view;

- (NSLayoutConstraint *)pinHeightEqualToView:(UIView *)view;

- (NSLayoutConstraint *)pinEdge:(LayoutEdge)edge toSuperviewEdge:(LayoutEdge)superviewEdge;

- (NSLayoutConstraint *)pinEdge:(LayoutEdge)edge1 toEdge:(LayoutEdge)edge2 ofView:(UIView *)view withInset:(CGFloat)inset;

- (NSArray *)pinEdgesToSuperWithInsets:(UIEdgeInsets)insets;

@end
