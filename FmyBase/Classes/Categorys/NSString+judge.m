//
//  NSString+judge.m
//  HGMMRAC
//
//  Created by eport on 2021/1/19.
//

#import "NSString+judge.h"

@implementation NSString (judge)

/// 有效的手机号码
+ (BOOL)wx_isValidMobile:(NSString *)str
{
    NSString *phoneRegex = @"^1[34578]\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}

@end
