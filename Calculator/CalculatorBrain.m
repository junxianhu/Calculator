//
//  CalculatorBrain.m
//  Calculator
//
//  Created by cipher on 15/8/27.
//  Copyright (c) 2015年 com.lab1411.cipher. All rights reserved.
//

#import "CalculatorBrain.h"

//private
@interface CalculatorBrain()

//初始化为nil或0
@property(nonatomic,strong) NSMutableArray *operandStack;

@end



@implementation CalculatorBrain
@synthesize operandStack = _operandStack;
//只有一个变量指针 不分配内存空间

-(NSMutableArray *)operandStack{
    
    //延迟实例化
    if(_operandStack == nil){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void)setOperandStack:(NSMutableArray *)operandStack{
    _operandStack = operandStack;
}

//入操作数
-(void)pushOperation:(double) operand{
    //add只能加入对象
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

//出栈操作数
-(double)popOperand{
    
    NSNumber *operandObject = [self.operandStack lastObject];
    //数组为空 删除会崩溃
    if (operandObject != nil) {
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation{
    
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result =[self popOperand] + [self popOperand];
    }else if ([operation isEqualToString:@"/"]){
        
        double tmp2 = [self popOperand];
        double tmp1 = [self popOperand];
        if (tmp2 != 0) {
            result = tmp1 / tmp2;
        }
    }else if([operation isEqualToString:@"*"]){
        result = [self popOperand] * [self popOperand];
    }else if([operation isEqualToString:@"-"]){
        double tmp2 = [self popOperand];
        double tmp1 = [self popOperand];
        result = tmp1 - tmp2;
    }
    
    //结果入栈
    [self pushOperation:result];
    return result;
}


@end
