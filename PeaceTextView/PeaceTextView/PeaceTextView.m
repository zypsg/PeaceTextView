//
//  PeaceTextView.m
//  PeaceTextView
//
//  Created by zhaoyp on 9/29/12.
//  Copyright (c) 2012 zhaoyp. All rights reserved.
//

#import "PeaceTextView.h"

@interface  PeaceTextView()
{
    UILabel* placeholderLabel;
}

- (void) addPlaceholderLabelIfNeeded;
@end

@implementation PeaceTextView
@synthesize placeholder;
@synthesize placeholderColor;
@synthesize placeholderFont;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
 
    }
    return self;
}




- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(![self hasText]) {
 
        [UIView animateWithDuration:0.15 animations:^{
            placeholderLabel.alpha = 1.0;
        }];
    } else if ([[self subviews] containsObject:placeholderLabel]) {
        
        [UIView animateWithDuration:0.15 animations:^{
            placeholderLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void) setPlaceholder:(NSString *)placeholderNew
{
 
    [self addPlaceholderLabelIfNeeded];
    [placeholderNew retain];
    [placeholder release];
    placeholder = placeholderNew;
    placeholderLabel.text = placeholder;

}

 

- (void) setPlaceholderFont:(UIFont *)placeholderFontNew
{
    [self addPlaceholderLabelIfNeeded];
    
    [placeholderFontNew retain];
    [placeholderFont release];
    placeholderFont = placeholderFontNew;
    placeholderLabel.font = placeholderFont;
}

- (void) setPlaceholderColor:(UIColor *)placeholderColorA
{
    
    [self addPlaceholderLabelIfNeeded];
    [placeholderColorA retain];
    [placeholderColor release];
    placeholderColor = placeholderColorA;
    placeholderLabel.textColor = placeholderColor;
}


- (void) addPlaceholderLabelIfNeeded
{
    if(placeholderLabel==nil)
    {
        placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, self.frame.size.width - 20.0, 34.0)];
        [placeholderLabel setText:placeholder];
        [placeholderLabel setBackgroundColor:[UIColor clearColor]];
        [placeholderLabel setFont: self.font];
        [placeholderLabel setTextColor:[UIColor lightGrayColor]];
        placeholderLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:placeholderLabel];
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:NULL];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textViewDidChange) name:UITextViewTextDidChangeNotification
                                                   object:self];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textViewDidEndEditing) name:UITextViewTextDidEndEditingNotification
                                                   object:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void) dealloc
{
    [placeholderColor release];
    [placeholderFont release];
    [placeholderLabel release];
    [super dealloc];
}

#pragma mark-
#pragma mark---handle notification ---
- (void) textViewDidChange
{
    if(![self hasText]) {
        [UIView animateWithDuration:0.15 animations:^{
            placeholderLabel.alpha = 1.0;
        }];
    } else  {
        placeholderLabel.alpha = 0.0;
 
    }
}

- (void)textViewDidEndEditing
{
    if (![self hasText]) {
        [UIView animateWithDuration:0.15 animations:^{
            placeholderLabel.alpha = 1.0;
        }];
    }
}

@end
