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
	NSArray* args = [command arguments];
	NSString* message = [args objectAtIndex:0];

    NSDictionary *payload = @{@"message":@"Test Message From Rider App"};
    NSLog(@"%s", payload[@"message"]);

    [[WCSession defaultSession] sendMessage:payload
                               replyHandler:nil
                               errorHandler:nil
     ];
}

-(void) sendObject:(CDVInvokedUrlCommand*)command
{
	NSArray* args = [command arguments];
	NSString* jsonString = [args objectAtIndex:0];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonString options:0 error:NULL];
	NSLog(@"%s", json[@"test"]);

}

-(void)updateAppContext:(CDVInvokedUrlCommand*)command
{
	NSArray* args = [command arguments];
	NSString* jsonString = [args objectAtIndex:0];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonString options:0 error:NULL];
	[[WCSession defaultSession] updateApplicationContext:json error:nil]
}


-(void) listenForMessage:(CDVInvokedUrlCommand*)command
{
    
}

-(void)checkAppContext:(CDVInvokedUrlCommand*)command{

}

@end

