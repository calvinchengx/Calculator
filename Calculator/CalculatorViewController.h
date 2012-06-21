//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Calvin Cheng on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"
#import <math.h>

// TODO: implement a state machine
/*
typedef enum {
    KeyPressStateNumber,
    KeyPressStateOperand,
    KeyPressStateDecimalPoint
} KeyPressState;
*/

/*
typedef enum {
    ScientificOperandIntegration,
    ScientificOperandDifferential,
} ScientificOperand;

static NSArray *scientficOperands = @"∫";
*/
 
@interface CalculatorViewController : UIViewController {
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
    BOOL operating;
}

- (IBAction) digitPressed:(NSString *)digit;
- (IBAction) operationPressed:(NSString *)sender;

@end
