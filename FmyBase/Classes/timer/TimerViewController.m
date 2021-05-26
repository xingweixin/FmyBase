//
//  TimerViewController.m
//  ObjcGo
//
//  Created by 邢伟新 on 2021/1/29.
//

#import "TimerViewController.h"
#import "WxMiddle.h"
#import "WxProxy.h"

@interface TimerViewController ()
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"timer";
    self.view.backgroundColor = [UIColor whiteColor];
    [self fun3];
}


-(void)fun3{
    
    WxProxy *middle = [WxProxy initTarget:self];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:middle selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

-(void)fun2{
    
    WxMiddle *middle = [[WxMiddle alloc]initTarget:self];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:middle selector:@selector(timerAction:) userInfo:nil repeats:YES];
}
-(void)timerAction:(NSTimer *)timer{
    NSLog(@"fengmengyue");
}


-(void)fun1{
    
    if (@available(iOS 10.0, *)) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            
            NSLog(@"xingweixin");
        }];
    } else {
        // Fallback on earlier versions
    }
    
    
}


-(void)dealloc{
    NSLog(@"---%s",__func__);
    
    [self.timer invalidate];
    self.timer = nil;
    
}


@end
