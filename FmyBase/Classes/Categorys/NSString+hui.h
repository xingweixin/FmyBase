//
//  NSString+hui.h
//  HGMM
//
//  Created by @HUI on 15/8/6.
//  Copyright (c) 2015年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (hui)

+ (NSString *) jsonStringWithDic:(NSDictionary*)dic;
+ (NSString *) stringWithCurrentDate;
+ (NSString *) stringWithLocalWiFiIPAddress;
+ (NSString *) stringWithCurrentVision;
+ (NSString *) stringWithCurrentDeviceModel;


@end
