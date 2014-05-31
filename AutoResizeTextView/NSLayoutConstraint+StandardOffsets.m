//
//  NSLayoutConstraint+StandardOffsets.m
//  AutoResizeTextView
//
//  Created by bbpan on 5/31/14.
//
//

#import "NSLayoutConstraint+StandardOffsets.h"

@implementation NSLayoutConstraint (StandardOffsets)

+ (CGFloat)standardConstantBetweenSiblings {
    static CGFloat value;
    
    if (!isnormal(value)) {
        UIView *view = [UIView new];
        NSLayoutConstraint* siblingsConstraint;
        siblingsConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"[view]-[view]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(view)][0];
        // 8.0
        value = siblingsConstraint.constant;
    }
    return value;
}

+ (CGFloat)standardConstantToSuperview {
    static CGFloat value;
    
    if (!isnormal(value)) {
        UIView *view = [UIView new];
        UIView *superview = [UIView new];
        [superview addSubview:view];
        NSLayoutConstraint* superviewConstraint;
        superviewConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"[view]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(view)][0];
        // 20.0
        value = superviewConstraint.constant;
    }
    return value;
}

@end
