//
//  BackgroundTask.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "BackgroundTask.h"


@implementation BackgroundTask

- (void) start:(CDVInvokedUrlCommand*)command;
{
    __block UIBackgroundTaskIdentifier backgroundTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskId];
        backgroundTaskId = UIBackgroundTaskInvalid;
    }];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = [CDVPluginResult
                                         resultWithStatus:CDVCommandStatus_OK
                                         messageAsInt:(int)backgroundTaskId];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) stop:(CDVInvokedUrlCommand*)command;
{
    if ([command.arguments count] > 0) {
        int backgroundTaskId = [[command.arguments objectAtIndex:0] intValue];
        [[UIApplication sharedApplication] endBackgroundTask:(UIBackgroundTaskIdentifier)backgroundTaskId];
    } else {
        NSLog(@"Called BackgroundTask.stop without TaskId");
    }
}

@end
