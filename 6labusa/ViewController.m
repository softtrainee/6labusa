

#import "ViewController.h"
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Add a custom login button to your app
//    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    myLoginButton.backgroundColor=[UIColor darkGrayColor];
//    myLoginButton.frame=CGRectMake(0,0,180,40);
//    myLoginButton.center = self.view.center;
//    [myLoginButton setTitle: @"My Login Button" forState: UIControlStateNormal];
//    
//    // Handle clicks on the button
//    [myLoginButton
//     addTarget:self
//     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    
//    // Add the button to the view
//    [self.view addSubview:myLoginButton];
    
    
    // In your viewDidLoad method:
  //  loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    
}

// Once the button is clicked, show the login dialog
//-(void)loginButtonClicked
//{
//    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    
//    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
//        if (error) {
//            NSLog(@"Process error");
//        } else if (result.isCancelled) {
//            NSLog(@"Cancelled");
//        } else {
//            NSLog(@"Logged in");
//            
//            
//            
//        }
//    }];
//    
////    [login logInWithReadPermissions: @[@"public_profile"]
////     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
////         if (error) {
////             NSLog(@"Process error");
////         } else if (result.isCancelled) {
////             NSLog(@"Cancelled");
////         } else {
////             NSLog(@"Logged in");
////         }
////     }];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
