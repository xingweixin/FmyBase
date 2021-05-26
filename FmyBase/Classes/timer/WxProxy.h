//
//  WxProxy.h
//  ObjcGo
//
//  Created by 邢伟新 on 2021/1/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WxProxy : NSProxy
+(instancetype)initTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
