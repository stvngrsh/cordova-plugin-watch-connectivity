#import "CDVWatch.h"

@implementation CDVWatch

-(void) initialize:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        if ([WCSession isSupported]) {
            WCSession *session = [WCSession defaultSession];
            session.delegate = self;
            [session activateSession];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        
        else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"WCSession not supported"];
            
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void) sendMessage:(CDVInvokedUrlCommand*)command
{
    NSDictionary *payload = @{@"message":@"Test Message From Rider App"};
    NSLog(@"%s", payload[@"message"]);
    [[WCSession defaultSession] sendMessage:payload
                               replyHandler:nil
                               errorHandler:nil
     ];
}

-(void) listenForMessage:(CDVInvokedUrlCommand*)command
{
    
}

@end

