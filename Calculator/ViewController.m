//
//  ViewController.m
//  Calculator
//
//  Created by cipher on 15/8/26.
//  Copyright (c) 2015年 com.lab1411.cipher. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

//private
@interface ViewController()
@property (nonatomic) BOOL userIsInTheMIdddlOfEnteringANumber;
//用来指向model
@property(nonatomic,strong) CalculatorBrain *brain;
@end


@implementation ViewController

@synthesize display= _display;
@synthesize userIsInTheMIdddlOfEnteringANumber = _userIsInTheMIdddlOfEnteringANumber;
@synthesize brain=_brain;

//延迟实例化
-(CalculatorBrain *)brain{
    if (!_brain) {
        _brain = [[CalculatorBrain alloc]init];
    }
    return _brain;
}


//IBAction:void 标记为action id:可以指向任何类型的指针
//更改id为UIButton类型即可
- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit =  [sender currentTitle];
    //NSLog(@"digit pressed = %@",digit);
    
//    UILabel *myDisplay = self.display;//[self display];
//    NSString *currentText = [myDisplay text];
//    NSString *newText = [currentText stringByAppendingString:digit];
//    myDisplay.text = newText;
//    上面4行精简一下代码为
//    self.display.text = [self.display.text stringByAppendingString:digit
    
    if (self.userIsInTheMIdddlOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMIdddlOfEnteringANumber =  YES;
    }
}

//先按2个数字 然后按操作符
//所以这里按下操作符就是要计算结果了
- (IBAction)operationPressed:(UIButton *)sender {
    
    if (self.userIsInTheMIdddlOfEnteringANumber) {
        [self enterPressed];
    }
    //利用model计算结果，然后输出
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}

//按下enter键，就是入栈一个数字
- (IBAction)enterPressed {
    
    [self.brain pushOperation:[self.display.text doubleValue]];
    self.userIsInTheMIdddlOfEnteringANumber = NO;
    
    //NSLog(@"dfsdf:%@",self.txtName.text);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
