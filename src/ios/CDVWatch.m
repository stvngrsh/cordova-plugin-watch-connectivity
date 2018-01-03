#import "CDVWatch.h"

@implementation CDVWatch

-(void) initialize:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        NSLog(@"%s", "In objc");
        CDVPluginResult* pluginResult = nil;

        if ([WCSession isSupported]) {
            WCSession *session = [WCSession defaultSession];
            session.delegate = self;
            [session activateSession];
            NSLog(@"%s", "WCSession initialized.");
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        
        else {
            NSLog(@"%s", "WCSession failed to initialize. WCSession is not supported on this device.");
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"WCSession not supported"];

        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void) passMessage:(CDVInvokedUrlCommand*)command 
{

}

-(void) listenForMessage:(CDVInvokedUrlCommand*)command 
{
   
}

@end
