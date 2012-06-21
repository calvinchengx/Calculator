//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Calvin Cheng on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain 

- (void)setOperand:(double)anOperand
{
    operand = anOperand;
}

- (void)performWaitingOperation
// Actually executing the operation
{
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqual:waitingOperation]) {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

- (double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operation isEqual:@"sin"]) {
        operand = sin(operand);
    } else if ([operation isEqual:@"cos"]) {
        operand = cos(operand);
    } else if ([operation isEqual:@"tan"]) {
        operand = tan(operand);
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

@end
