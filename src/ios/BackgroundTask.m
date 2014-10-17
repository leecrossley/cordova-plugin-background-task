//
//  BackgroundTask.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "BackgroundTask.h"

static UIBackgroundTaskIdentifier backgroundTaskId;

@implementation BackgroundTask

+ (void) initialize
{
    backgroundTaskId = UIBackgroundTaskInvalid;
}

- (void) start:(CDVInvokedUrlCommand*)command;
{
    backgroundTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskId];
        backgroundTaskId = UIBackgroundTaskInvalid;
    }];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
