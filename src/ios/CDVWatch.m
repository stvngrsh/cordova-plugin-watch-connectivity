#import "CDVWatch.h"

@implementation CDVWatch

-(void) test:(CDVInvokedUrlCommand*)command
{
    NSArray* arguments = [command arguments];
    NSString* test1 = [arguments objectAtIndex:0];
    NSString* test2 = @"THE PLUGIN WORKS";

    NSLog(@"%@",test1);
    NSLog(@"%@",test2);
}

@end
