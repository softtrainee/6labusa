

#import <UIKit/UIKit.h>
#import <Reachability.h>
@class login;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navcontroller;
@property (strong, nonatomic) login *controller;
@property (strong, nonatomic) UIViewController *viewController;


// Reachability


@property (nonatomic, retain) Reachability *hostReachability;
@property (nonatomic, retain) Reachability *internetReachability;
@property (nonatomic, retain) Reachability *wifiReachability;

- (void)DefaultInitScreen;
- (void)Loggedin;
- (void)Logout;

@end

