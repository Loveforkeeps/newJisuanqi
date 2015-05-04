//
//  NSObject+Calculation.h
//  Jisuanqi2.0
//
//  Created by EMo‘s mac  on 4/30/15.
//  Copyright (c) 2015 EMo‘s mac . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Operand.h"

@interface Calculation:NSObject
+(NSString *)calcOprandA:(Operand *)A//选择器
                 OprandB:(Operand *)B
                OPerator:(char)op;
+(NSString *)zeroCut:(NSString *)output;
@end
