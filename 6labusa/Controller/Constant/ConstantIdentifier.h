


// console log to print

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif


// keyboard offset screen

#define kOFFSET_FOR_KEYBOARD  80.0


// version , width & height

#define KVersion [[[UIDevice currentDevice] systemVersion] intValue]
#define kSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define kSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)-70


//  login screen header
#define kLEFT_MARGIN 10
#define kSCREEN_HEADER 50
#define kTXT_HEIGHT 30
#define kSCREEN_CENTERVIEWHEIGHT kSCREEN_HEIGHT-(1.7*kSCREEN_HEADER)

// error manage by macro

#define InternalError               @"There is an error.Please try again."
#define InternetMessage             @"Internet connection is not available. Please check your wifi setting or cellular data."
#define SlowInternet                @"Your internet connection is very slow.PLease tr again later."
#define EmailExisted                @"Email Id/Username does not exist."



//All URLs

#define BaseURL @"http://6labusa.projectupdate.website/api/"
#define ImageBaseURL @"http://6labusa.projectupdate.website"
#define BlockURL @"http://6labusa.projectupdate.website/blog/"

#define kGOOGLE_API_KEY @"AIzaSyDa7zr2sb6Mldp0396nb3bUwQEHrvVHgxU"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ConstantIdentifier : NSObject



+ (void)getAlert:(NSString*)message view:(id)view;

+ (void)setViewMovedUp:(BOOL)movedUp view:(UIView*)view;
+ (BOOL)checkNetworkConnection;
+ (void)setViewMovedUpRegistration:(BOOL)movedUp view:(UIView*)view count:(int)count;
 

@end
