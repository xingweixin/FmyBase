//
//  WxMiddle.m
//  ObjcGo
//
//  Created by 邢伟新 on 2021/1/29.
//

#import "WxMiddle.h"

@interface WxMiddle ()
@property(nonatomic,weak)id target;

@end

@implementation WxMiddle

-(instancetype)initTarget:(id)target{
    self = [super init];
    if (self) {
        self.target = target;
    }
    return self;
}





-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    return self.target;
}




@end
