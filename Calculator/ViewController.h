//
//  ViewController.h
//  Calculator
//
//  Created by cipher on 15/8/26.
//  Copyright (c) 2015年 com.lab1411.cipher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//为什么使用weak，因为UIlabel已经有个strong指针了，在父窗口view已经有strong指向它了，只需要它在view里面，所以weak //线程非安全
@property (weak, nonatomic) IBOutlet UILabel *display;
//@property (weak, nonatomic) IBOutlet UITextField *txtName;

@end

