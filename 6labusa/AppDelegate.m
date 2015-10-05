

#import "AppDelegate.h"
#import "ConstantIdentifier.h"
#import "home.h"
#import "category.h"
#import "vendor.h"
#import "mosque.h"
#import "myaccount.h"
#import "product.h"
#import "sharedobject.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>


// slider menu hedaer file

#import <MFSideMenuContainerViewController.h>

#import "leftmenu.h"

// custom tab bar
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //[self DefaultInitScreen];
    [self TabBarLayout];
    [self.window makeKeyAndVisible];
    
    
    
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application  openURL:url sourceApplication:sourceApplication  annotation:annotation
            ];
}





-(void)startReachability{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReachability= [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus=[self.hostReachability currentReachabilityStatus];
    sharedobject *sh=[sharedobject sharedmanager];
    
    switch (internetStatus) {
            
        case NotReachable:
            sh.networkFlag=FALSE;
            break;
            
        case ReachableViaWiFi:
            sh.networkFlag=TRUE;
            
        case ReachableViaWWAN:
            sh.networkFlag=TRUE;
            
        default:
            break;
    }
    
    self.internetReachability=[Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    
    
}


-(void)reachabilityChanged:(NSNotification*)note{
    
    sharedobject *sh=[sharedobject sharedmanager];
    Reachability *reachability=[note object];
    NSParameterAssert([reachability isKindOfClass:[Reachability class]]);
    NetworkStatus internetStatus =[reachability currentReachabilityStatus];
    
    switch (internetStatus) {
            
        case NotReachable:
            sh.networkFlag=FALSE;
            break;
        case ReachableViaWiFi:
            sh.networkFlag=TRUE;
            break;
        case ReachableViaWWAN:
            sh.networkFlag=TRUE;
            break;
            
        default:
            break;
    }
    
}


-(void)DefaultInitScreen{
    
//    self.controller = [[login alloc]init];
//    self.navcontroller = [[UINavigationController alloc]initWithRootViewController:self.controller];
//    self.navcontroller.navigationBarHidden=YES;
//    self.window.rootViewController=self.navcontroller;
    
}






-(void)TabBarLayout{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    [self customizeInterface];
    
}


#pragma mark - Methods

- (void)setupViewControllers {
    
    
    
    
    
    
    
    home *firstViewController = [[home alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    
    category *secondViewController = [[category alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:secondViewController];
    
    
    
    vendor *thirdViewController = [[vendor alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    
    
    
    mosque *forthViewController = [[mosque alloc] init];
    UIViewController *forthNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:forthViewController];
    
    
    
    
    
    myaccount *fifthViewController = [[myaccount alloc] init];
    UIViewController *fifthNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:fifthViewController];
    
    
    
    
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController,forthNavigationController,fifthNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"v11",@"m11",@"A11"];
    NSArray *tabBarItemName = @[@"Home",@"Categoary",@"Vendor",@"Mosque",@"Account"];
    NSInteger index = 0;
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        
       // [[item objectAtIndex:0] setTitle:NSLocalizedString(@"BotonMapas", @"comment")];

        
        [item setTitle:[NSString stringWithFormat:@"%@",[tabBarItemName objectAtIndex:index]]];

        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
}


- (void)customizeInterface {
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
}







- (void)Loggedin{
    
    
    home *rootController = [[home alloc]init];
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:rootController];
    //self.window.rootViewController = navigation;
    
    MFSideMenuContainerViewController *container = [[MFSideMenuContainerViewController alloc]init];
    //UINavigationController *navigationController = [[UINavigationController alloc]init];
    
    leftmenu *leftSideMenuViewController = [[leftmenu alloc]init];
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setCenterViewController:navigation];
    self.window.rootViewController = container;
    
    
    
    /*
    LHHomeViewController *rootController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"homeview"];
    
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:rootController];
    self.window.rootViewController = navigation;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
    
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
    
    UIViewController *leftSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"leftSideMenuViewController"];
    
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setCenterViewController:navigationController];
    self.window.rootViewController = container;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    */
}


- (void)Logout{
    [self DefaultInitScreen];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
