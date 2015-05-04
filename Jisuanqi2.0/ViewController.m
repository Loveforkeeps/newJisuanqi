//
//  ViewController.m
//  Jisuanqi2.0
//
//  Created by EMo‘s mac  on 4/30/15.
//  Copyright (c) 2015 EMo‘s mac . All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Operand.h"
#import "NSObject+Calculation.h"

@interface ViewController ()
- (IBAction)tapDigit:(id)sender;
- (IBAction)tapAC:(id)sender;
- (IBAction)tapBackSpace:(id)sender;
- (IBAction)tapEqual:(id)sender;
- (IBAction)tapPlus:(id)sender;
- (IBAction)tapMinus:(id)sender;
- (IBAction)tapMulitiply:(id)sender;
- (IBAction)tapDivide:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbDisplay;

@end

@implementation ViewController

@synthesize lbDisplay;
@synthesize OprandA;
@synthesize OprandB;
@synthesize Operator;

- (void)ClearState{
    //初始化运算元

    OprandA = [[Operand alloc]init];
    OprandB = [[Operand alloc]init];
    Operator = ' ';
    [lbDisplay setText: @"0"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ClearState];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapDigit:(id)sender {//数字与小数点输入会触发tapDigit,根据tag值来判断所按下的键
    //sender 就代表所按的键
    NSString *input;
    if ([sender tag]==10) {
        input = @".";
    }
    else{
        input = [NSString stringWithFormat:@"%li",(long)[sender tag]];
    }
    
    if(Operator == ' '){//如果未有运算符，则为第一个运算元
        [OprandA AppendNum:input];
        //将改变过的输入数输出到银幕上
        lbDisplay.text = [OprandA toshowString];
    }
    else{
        [OprandB AppendNum:input];
        lbDisplay.text = [OprandB toshowString];
    }
}

- (IBAction)tapAC:(id)sender {
    [self ClearState];
}

- (IBAction)tapBackSpace:(id)sender {
    //退位键
    if (Operator == ' ') {
        [OprandA DoBackSpace];
        lbDisplay.text = [OprandA toshowString];
    }
    else{
        [OprandB DoBackSpace];
        lbDisplay.text = [OprandB toshowString];
    }
    
   }


- (IBAction)tapEqual:(id)sender {
    if (Operator != ' ') {
        //当存在运算子的时候。将算元与运算子丢到Calcaulation中
        lbDisplay.text = [Calculation calcOprandA:OprandA OprandB:OprandB OPerator:Operator];
    }
}

- (IBAction)tapPlus:(id)sender {
    Operator = '+';
}

- (IBAction)tapMinus:(id)sender {
    Operator = '-';
}

- (IBAction)tapMulitiply:(id)sender {
    Operator = '*';
}

- (IBAction)tapDivide:(id)sender {
    Operator = '/';
}


@end
