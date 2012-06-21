//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Calvin Cheng on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (CalculatorBrain *)brain
{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (NSString *)doNotAllowDot:(NSString *)digit
{
    // Check if a "." is already present in display. If so, do not let another "." be added 
    NSString *previousResults = [display text];
    int times = [[previousResults componentsSeparatedByString:@"."] count] - 1;
    if ((times >= 1) && [digit isEqual:@"."]) {
        digit = @"";
    }
    return digit;   
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    
    if (userIsInTheMiddleOfTypingANumber) {
        digit = [self doNotAllowDot:digit]; // we only reset digit when userIsInTheMiddleOfTypingANumber
        [display setText:[[display text] stringByAppendingString:digit]];  
    } else {
        [display setText:digit];   // simply pass the digit user has typed to the label
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    
    // perform the operation
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
}

@end