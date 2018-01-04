#import <Cordova/CDVPlugin.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface CDVWatch : CDVPlugin <WCSessionDelegate>
{

}

-(void)initialize:(CDVInvokedUrlCommand*)command;
-(void)sendMessage:(CDVInvokedUrlCommand*)command;
-(void)sendObject:(CDVInvokedUrlCommand*)command;
-(void)updateAppContext:(CDVInvokedUrlCommand*)command;
-(void)listenForMessage:(CDVInvokedUrlCommand*)command;
-(void)checkAppContext:(CDVInvokedUrlCommand*)command;

@end
