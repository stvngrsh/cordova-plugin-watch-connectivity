#import "CDVWatch.h"

@implementation CDVWatch

-(void) initialize:(CDVInvokedUrlCommand*)command
{
  	if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        NSLog(@"%@", "WCSession initialized.")
    }

  	else {
  		NSLog(@"%@", "WCSession failed to initialize. WCSession is not supported on this device.")
  	}
}

-(void) passMessage:(CDVInvokedUrlCommand*)command 
{

}

-(void) listenForMessage:(CDVInvokedUrlCommand*)command 
{
   
}

@end
