//
//  NSObject+Operand.m
//  Jisuanqi2.0
//
//  Created by EMo‘s mac  on 4/30/15.
//  Copyright (c) 2015 EMo‘s mac . All rights reserved.
//

#import "NSObject+Operand.h"


@implementation Operand

@synthesize intPart;
@synthesize decPart;
@synthesize hasDec;
@synthesize length;
-(Operand *)init
{   //初始化
    self=[super init];
    if (self) {
        [self Clear];
    }
    return self;
}

-(void)Clear{
    //清除运算元
    intPart = @"0";
    decPart = @"";
    hasDec = false;
}
-(NSString *)toshowString{
    if (hasDec) {
        return [NSString stringWithFormat:@"%@.%@",intPart,decPart];
    }
    else{
        return intPart;
    }
}
-(void) AppendNum:(NSString *)Num{
    if ([Num isEqualToString:@"."]){//调用了字符串比较方法
        hasDec = true;
    }
    else{//输入的不是小数点
        if (length<12) {//避免位数过多
            if (hasDec) {//有小数点
                decPart = [NSString stringWithFormat:@"%@%@",decPart,Num];
                length +=1;
            }
            else {//无小数点
                if ([intPart isEqualToString:@"0"]) {//整数部分为零
                    intPart = Num;
                    length = 1;
                }
                else{
                    intPart = [NSString stringWithFormat:@"%@%@",intPart,Num];
                    length += 1;
                }
            }
        }
    }
}
-(void)DoBackSpace{
    if (hasDec) {
        if (decPart.length>0) {//有小数，且长度大于零
            decPart = [decPart substringToIndex:(decPart.length-1)];//调用函数取多少位
            length = length - 1;
        }
        else{//有小数却没有长度，则剪掉掉小数点
            hasDec = false;
        }
    }
    else{
        if (intPart.length>1) {
            intPart = [intPart substringToIndex:(intPart.length-1)];
            length -= 1;
        }
        else{
            intPart = @"0";
            length = 1;
        }
    }
}
-(double) ToDouble {
    //呼叫自己的物件方法toshowSting,将NSString转成Double返回
    return [[self toshowString]doubleValue];
}
    
@end
