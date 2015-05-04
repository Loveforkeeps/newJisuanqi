//
//  ViewController.h
//  Jisuanqi2.0
//
//  Created by EMo‘s mac  on 4/30/15.
//  Copyright (c) 2015 EMo‘s mac . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Operand.h"
@interface ViewController : UIViewController{
    Operand *OprandA;//第一个运算元
    Operand *OprandB;//第二个运算元
    char Operator;//运算子
}
@property (retain,nonatomic) IBOutlet UILabel *lbdisplay;
@property Operand *OprandA;
@property Operand *OprandB;
@property char Operator;
-(void) ClearState;//用于viewdidload的初始化程序
@end

