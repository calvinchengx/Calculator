//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Calvin Cheng on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction) digitPressed:(NSString *)digit;
- (IBAction) operationPressed:(NSString *)sender;

@end
