//
//  NSObject+Calculation.m
//  Jisuanqi2.0
//
//  Created by EMo‘s mac  on 4/30/15.
//  Copyright (c) 2015 EMo‘s mac . All rights reserved.
//

#import "NSObject+Calculation.h"

@implementation Calculation
+(NSString *)calcOprandA:(Operand *)A OprandB:(Operand *)B OPerator:(char)op{
    double result;
    switch (op) {
        case '+':
            result = [A ToDouble]+[B ToDouble];
            break;
        case '-':
            result = [A ToDouble]-[B ToDouble];
            break;
        case '*':
            result = [A ToDouble]*[B ToDouble];
            break;
        case '/':
            result = [A ToDouble]/[B ToDouble];
            break;
        default:
            result = 0.0;
            break;
    }
    
    //将结果转换成String，为了不损失精度，故选取了15位小数
    NSString *resultSring = [NSString stringWithFormat:@"%.15f",result];
    resultSring = [Calculation zeroCut:resultSring];
    return resultSring;
}
+(NSString *) zeroCut:(NSString *)output{
    //从最后开始只要是零就删除
    while ([output characterAtIndex:output.length-1] =='0') {
        output = [output substringToIndex:output.length-1];
    }
    //如果最后一位是小数点就删除
    if ([output characterAtIndex:output.length-1] == '.') {
        output = [output substringToIndex:output.length-1];
    }
    
    return output;
}
@end
