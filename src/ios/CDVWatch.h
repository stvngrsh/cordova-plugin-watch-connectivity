#import <Cordova/CDVPlugin.h>

@interface CDVWatch : CDVPlugin {
    NSString* test;
}

-(void)test:(CDVInvokedUrlCommand*)command;

@end
