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
    __block CDVPluginResult* pluginResult = nil;

    NSArray* args = [command arguments];
    NSString* message = [args objectAtIndex:0];
    NSLog(@"%@", message);
    
    NSDictionary *payload = @{@"message":message};

    [[WCSession defaultSession] sendMessage:payload
                               replyHandler:^(NSDictionary *reply) {
                                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                               }
                               errorHandler: ^(NSError *error) {
                                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
                               }
     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

-(void) sendObject:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* pluginResult = nil;

    NSArray* args = [command arguments];
    NSString* jsonString = [args objectAtIndex:0];
    NSLog(@"%@", jsonString);
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *payload = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    NSLog(@"%@", payload[@"test"]);
    
    [[WCSession defaultSession] sendMessage:payload
                               replyHandler:^(NSDictionary *reply) {
                                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                               }
                               errorHandler: ^(NSError *error) {
                                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
                               }
     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

-(void)updateAppContext:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    NSArray* args = [command arguments];
    NSString* jsonString = [args objectAtIndex:0];
    NSLog(@"%@", jsonString);
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *payload = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    NSLog(@"%@", payload[@"test"]);

    NSError *error = nil;
    BOOL success = [[WCSession defaultSession] updateApplicationContext:payload error:&error];
    
    if(success == NO) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


-(void) listenForMessage:(CDVInvokedUrlCommand*)command
{
    
}

-(void)checkAppContext:(CDVInvokedUrlCommand*)command{
    
}

@end

