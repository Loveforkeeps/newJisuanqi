//
//  NSObject+Operand.h
//  Jisuanqi2.0
//
//  Created by EMo‘s mac  on 4/30/15.
//  Copyright (c) 2015 EMo‘s mac . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Operand:NSObject {
    NSString *intPart;  //save inter
    NSString *decPart;  //save xiaoshu
    BOOL hasDec;        //if Decimal
    int length;        //定义精度
}

-(Operand *) init;
-(void) Clear;
-(NSString *) toshowString; //将operand物件转换成一个字符
-(void) AppendNum:(NSString *)Num;//0~9&.要做的事
-(void) DoBackSpace;
-(double) ToDouble;
@property NSString *intPart;
@property NSString *decPart;
@property BOOL hasDec;
@property int length;

@end
