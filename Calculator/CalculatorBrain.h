//
//  CalculatorBrain.h
//  Calculator
//
//  Created by cipher on 15/8/27.
//  Copyright (c) 2015年 com.lab1411.cipher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperation:(double) operand;
-(double)performOperation:(NSString *)operation;

@end
