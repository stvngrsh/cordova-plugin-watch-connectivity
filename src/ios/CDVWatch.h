#import <Cordova/CDVPlugin.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface CDVWatch : CDVPlugin <WCSessionDelegate>
{

}

-(void)initialize:(CDVInvokedUrlCommand*)command;
-(void)passMessage:(CDVInvokedUrlCommand*)command;
-(void)listenForMessage:(CDVInvokedUrlCommand*)command;

@end
