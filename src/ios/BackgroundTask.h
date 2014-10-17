//
//  BackgroundTask.h
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//

#import "Foundation/Foundation.h"
#import "Cordova/CDV.h"

@interface BackgroundTask : CDVPlugin

- (void) start:(CDVInvokedUrlCommand*)command;

@end
