//
//  WxProxy.m
//  ObjcGo
//
//  Created by 邢伟新 on 2021/1/29.
//

#import "WxProxy.h"

@interface WxProxy ()
@property(nonatomic,weak)id target;
@end


@implementation WxProxy


+(instancetype)initTarget:(id)target{
    
    WxProxy *p = [WxProxy alloc];
    p.target = target;
    return p;
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
//    return [self.target methodSignatureForSelector:sel];
//}
//- (void)forwardInvocation:(NSInvocation *)invocation {
//    [invocation invokeWithTarget:self.target];
//}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}
-(void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}


@end
