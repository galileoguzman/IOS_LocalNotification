//
//  ViewController.m
//  IOS_LocalNotification
//
//  Created by Galileo Guzman on 20/01/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Home.h"

@interface Home (){
    int timeTick;
    NSTimer *timer;
}
@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initController];
}

-(void)initController{
    timeTick = 0;
    
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(myTicker) userInfo:nil repeats:YES];
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:20];
    notification.alertBody = @"This is local notification!";
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 10;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)myTicker{
    //increment the timer
    timeTick++;
    //if we wanted to count down we could have done "timeTick--"
    
    //set a text label to display the time
    NSString *timeString =[[NSString alloc] initWithFormat:@"%d", timeTick];
    self.lblTimer.text = timeString;
    
    //if we want the timer to stop after a certain number of seconds we can do
    if(timeTick == 60){//stop the timer after 60 seconds
        [timer invalidate];
        self.lblTimer.text = @"";
    }
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval*)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

@end
