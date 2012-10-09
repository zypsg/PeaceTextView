//
//  PeaceTextView.h
//  PeaceTextView
//
//  Created by zhaoyp on 9/29/12.
//  Copyright (c) 2012 zhaoyp. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PeaceTextView;
@protocol PeaceTextViewDelegate <NSObject>

@optional

- (BOOL)textViewShouldBeginEditing:(PeaceTextView *)textView;
- (BOOL)textViewShouldEndEditing:(PeaceTextView *)textView;

- (void)textViewDidBeginEditing:(PeaceTextView *)textView;
- (void)textViewDidEndEditing:(PeaceTextView *)textView;

- (void)textViewDidChange:(PeaceTextView *)textView;
- (void)textViewDidChangeSelection:(PeaceTextView *)textView;

@end

@interface PeaceTextView : UITextView<UITextViewDelegate>
@property (nonatomic,retain) NSString* placeholder;
@property (nonatomic,retain) UIColor* placeholderColor;
@property (nonatomic,retain) UIFont* placeholderFont;
@property (nonatomic,assign) NSUInteger maxCharNum;
@property (nonatomic,assign) id<PeaceTextViewDelegate> peaceDelegate;
@end
