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
	NSString *message = @"TEST MESSAGE";
	NSDictionary *payload = [[NSDictionary alloc] initWithObjects:@[message] forKeys:@[@"message"]];

	[[WCSession defaultSession] sendMessage:payload
        replyHandler:^(NSDictionary *reply) {
        	//handle reply from iPhone app here
        }
        errorHandler:^(NSError *error) {
        	//catch any errors here
        }
    ];
}

-(void) listenForMessage:(CDVInvokedUrlCommand*)command 
{
   
}

@end
