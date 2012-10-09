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
@synthesize peaceDelegate;
@synthesize maxCharNum;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
 
    }
    return self;
}

- (void)awakeFromNib
{
    self.delegate = self;
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
#pragma mark ---UITextViewDelegate Methods ---
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    BOOL ret = YES;
    if([peaceDelegate respondsToSelector:@selector(textViewShouldBeginEditing:)])
    {
        ret = [peaceDelegate textViewShouldBeginEditing:self];
    }
    return ret;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    BOOL ret = YES;
    if([peaceDelegate respondsToSelector:@selector(textViewShouldEndEditing:)])
    {
        ret = [peaceDelegate textViewShouldEndEditing:self];
    }
    return ret;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([peaceDelegate respondsToSelector:@selector(textViewDidBeginEditing:)])
    {
        [peaceDelegate textViewDidBeginEditing:self];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (![self hasText]) {
        [UIView animateWithDuration:0.15 animations:^{
            placeholderLabel.alpha = 1.0;
        }];
    }
    
    if([peaceDelegate respondsToSelector:@selector(textViewDidEndEditing:)])
    {
        [peaceDelegate textViewDidEndEditing:self];
    }
}

/*
 range.length 代表删除的字符个数，text代表即将输入的字符，
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    BOOL ret = YES;
    if(maxCharNum>0)
    {
        NSString* orginalText = textView.text;
        int length = [orginalText length]-range.length+[text length];
        if(length<=maxCharNum)
        {
            return YES;
        }
        return NO;
    }
    return ret;
}
- (void)textViewDidChange:(UITextView *)textView
{
    if(![self hasText]) {
        [UIView animateWithDuration:0.15 animations:^{
            placeholderLabel.alpha = 1.0;
        }];
    } else  {
        placeholderLabel.alpha = 0.0;
        
    }
    
    if([peaceDelegate respondsToSelector:@selector(textViewDidChange:)])
    {
        [peaceDelegate textViewDidChange:self];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if([peaceDelegate respondsToSelector:@selector(textViewDidChangeSelection:)])
    {
        [peaceDelegate textViewDidChangeSelection:self];
    }
}
@end
