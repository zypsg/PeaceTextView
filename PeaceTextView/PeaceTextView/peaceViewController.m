//
//  peaceViewController.m
//  PeaceTextView
//
//  Created by zhaoyp on 9/29/12.
//  Copyright (c) 2012 zhaoyp. All rights reserved.
//

#import "peaceViewController.h"
#import "PeaceTextView.h"

@interface peaceViewController ()

@property (nonatomic,retain) IBOutlet  PeaceTextView* textView;
@end

@implementation peaceViewController
@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.textView.placeholder = @"Please enter your name ";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc
{
    [textView release];
    [super dealloc];
}

@end
