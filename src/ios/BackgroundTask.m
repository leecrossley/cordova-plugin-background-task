//
//  BackgroundTask.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "BackgroundTask.h"

@implementation BackgroundTask

+ (void) initialize
{
    backgroundTaskID = UIBackgroundTaskInvalid;
}

- (void) start:(CDVInvokedUrlCommand*)command;
{
    backgroundTaskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskID];
        backgroundTaskID = UIBackgroundTaskInvalid;
    }];

    [self.commandDelegate runInBackground:^{
        // Run this in the background
    }];
}

@end
