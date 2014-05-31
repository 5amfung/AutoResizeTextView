//
//  AutoResizeTableViewCell.m
//  AutoResizeTextView
//
//  Created by bbpan on 5/26/14.
//
//

#import "AutoResizeTableViewCell.h"

@interface AutoResizeTableViewCell ()
@end

@implementation AutoResizeTableViewCell

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    /*
    [self.contentView layoutIfNeeded];

    CGSize size = self.textView.contentSize;
    NSLog(@"text view size: (%f, %f)", size.width, size.height);
    
    CGSize newSize = [self.textView sizeThatFits:CGSizeMake(self.textView.frame.size.width, FLT_MAX)];
    NSLog(@"text view size after sizeThatFits: (%f, %f)", newSize.width, newSize.height);
    */
}

@end
