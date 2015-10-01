

#import "ConstantIdentifier.h"
#import <UIKit/UIKit.h>
#import "sharedobject.h"
//#import "Reachability.h"
#import "AppDelegate.h"


@implementation ConstantIdentifier

+ (void)getAlert:(NSString*)message view:(id)view{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"6labusa" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
//    [self presentViewController:alertController animated:YES completion:nil];
    
    [alertController showViewController:alertController sender:nil];
    
}



+(void)setViewMovedUp:(BOOL)movedUp view:(UIView*)view{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = view.frame;
    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD+0;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.origin.y += kOFFSET_FOR_KEYBOARD+0  ;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    view.frame = rect;
    
    [UIView commitAnimations];
    
}


+(void)setViewMovedUpRegistration:(BOOL)movedUp view:(UIView*)view count:(int)count{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = view.frame;
    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD+0;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.origin.y += kOFFSET_FOR_KEYBOARD+0  ;
        rect.size.height -= kOFFSET_FOR_KEYBOARD*count;
    }
    view.frame = rect;
    
    [UIView commitAnimations];
    
}


+ (BOOL) checkNetworkConnection{
    
    sharedobject *sh=[sharedobject sharedmanager];
    if (sh.networkFlag==FALSE)
    {
        return NO;
    }
    return YES;
}



@end
