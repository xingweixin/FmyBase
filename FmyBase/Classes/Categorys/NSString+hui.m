//
//  NSString+hui.m
//  HGMM
//
//  Created by @HUI on 15/8/6.
//  Copyright (c) 2015年 cc. All rights reserved.
//

#import "NSString+hui.h"
#import <net/if.h>
#import <netdb.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <sys/sysctl.h>

@implementation NSString (hui)

+(NSString *)jsonStringWithDic:(NSDictionary *)dic{
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return json;
}

+(NSString *)stringWithCurrentDate{
    NSDate *date = [NSDate date];
    return [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]*1000];
}

+ (NSString *) stringWithLocalWiFiIPAddress
{
    BOOL success;
    struct ifaddrs * addrs;
    const struct ifaddrs * cursor;
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            // the second test keeps from picking up the loopback address
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return nil;
}

+ (NSString *)stringWithCurrentDeviceModel
{
    int mib[2];
    size_t len;
    char *machine;

    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);

    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);

    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    //加入新设备
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7 (CDMA)";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7 (GSM)";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus (CDMA)";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"国行(A1863)、日行(A1906)iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"美版(Global/A1905)iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"美版(Global/A1897)iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"国行(A1865)、日行(A1902)iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"美版(Global/A1901)iPhone X";
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhoneXR";
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhoneXS";
    if ([platform isEqualToString:@"iPhone11,4"] || [platform isEqualToString:@"iPhone11,6"]) return @"iPhoneXS MAX";
    if ([platform isEqualToString:@"iPhone12,1"]) return @"iPhone 11";
    if ([platform isEqualToString:@"iPhone12,3"]) return @"iPhone 11 Pro";
    if ([platform isEqualToString:@"iPhone12,5"]) return @"iPhone 11 Pro Max";
    
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone13,1"])   return @"iPhone 12 mini";
    if ([platform isEqualToString:@"iPhone13,2"])   return @"iPhone 12";
    if ([platform isEqualToString:@"iPhone13,3"])   return @"iPhone 12 Pro";
    if ([platform isEqualToString:@"iPhone13,4"])   return @"iPhone 12 Pro Max";

    
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1";
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2";
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3";
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4";
    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5";
    if ([platform isEqualToString:@"iPod7,1"])  return @"iPod Touch 6";
    if ([platform isEqualToString:@"iPod9,1"])  return @"iPod Touch 7";
    
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1";
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1";
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1";
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,7"])  return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,8"])  return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,8"])  return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,9"])  return @"iPad mini 4";
    if ([platform isEqualToString:@"iPad5,2"])  return @"iPad mini 4";
    if ([platform isEqualToString:@"iPad5,3"])  return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])  return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])  return @"iPad Pro (9.7-inch)";
    if ([platform isEqualToString:@"iPad6,4"])  return @"iPad Pro (9.7-inch)";
    if ([platform isEqualToString:@"iPad6,7"])  return @"iPad Pro (12.9-inch)";
    if ([platform isEqualToString:@"iPad6,8"])  return @"iPad Pro (12.9-inch)";
    if ([platform isEqualToString:@"iPad6,11"])  return @"iPad 5";
    if ([platform isEqualToString:@"iPad6,12"])  return @"iPad 5";
    if ([platform isEqualToString:@"iPad7,1"])  return @"iPad Pro 2(12.9-inch)";
    if ([platform isEqualToString:@"iPad7,2"])  return @"iPad Pro 2(12.9-inch)";
    if ([platform isEqualToString:@"iPad7,3"])  return @"iPad Pro (10.5-inch)";
    if ([platform isEqualToString:@"iPad7,4"])  return @"iPad Pro (10.5-inch)";
    if ([platform isEqualToString:@"iPad7,5"])  return @"iPad 6";
    if ([platform isEqualToString:@"iPad7,6"])  return @"iPad 6";
    if ([platform isEqualToString:@"iPad7,11"])  return @"iPad 7";
    if ([platform isEqualToString:@"iPad7,12"])  return @"iPad 7";
    if ([platform isEqualToString:@"iPad8,1"])  return @"iPad Pro (11-inch) ";
    if ([platform isEqualToString:@"iPad8,2"])  return @"iPad Pro (11-inch) ";
    if ([platform isEqualToString:@"iPad8,3"])  return @"iPad Pro (11-inch) ";
    if ([platform isEqualToString:@"iPad8,4"])  return @"iPad Pro (11-inch) ";
    if ([platform isEqualToString:@"iPad8,5"])  return @"iPad Pro 3 (12.9-inch) ";
    if ([platform isEqualToString:@"iPad8,6"])  return @"iPad Pro 3 (12.9-inch) ";
    if ([platform isEqualToString:@"iPad8,7"])  return @"iPad Pro 3 (12.9-inch) ";
    if ([platform isEqualToString:@"iPad8,8"])  return @"iPad Pro 3 (12.9-inch) ";
    if ([platform isEqualToString:@"iPad11,1"])  return @"iPad mini 5";
    if ([platform isEqualToString:@"iPad11,2"])  return @"iPad mini 5";
    if ([platform isEqualToString:@"iPad11,3"])  return @"iPad Air 3";
    if ([platform isEqualToString:@"iPad11,4"])  return @"iPad Air 3";
    
    // 其他
    if ([platform isEqualToString:@"i386"])   return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])  return @"iPhone Simulator";
    
    return platform;
    
    
}

+(NSString *) stringWithCurrentVision{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
}


@end
