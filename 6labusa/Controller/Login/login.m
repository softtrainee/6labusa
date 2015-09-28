

#import "login.h"
#import "ConstantIdentifier.h"
#import <QuartzCore/QuartzCore.h>

// Twitter
#import "TwitterOAuthViewController.h"


// Facebook
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface login (){
    
    // view's
    
    UIView *mainContainerView;
    UIView *headerView,*headerline;
    UIView *centerView;
    
    
    // Scroll View which contain user info

    UIScrollView *scrollView;
    
    // label's
    
    UILabel *headerLbl;
    UILabel *userNameLbl;
    UILabel *pwdLbl;
    
    // textfield's
    
    UITextField *userNameTxt;
    UITextField *pwdTxt;
    
    
    // button's
    
    UIButton *loginBtn;
    UIButton *signupBtn;
    UIButton *forgetPwdBtn;
    UIButton *fBtn;
    UIButton *twitterBtn;
    
    
}




@end

@implementation login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    //
    
    [self LoginScreen];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Statusbar

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}



-(void)LoginScreen{
    
    
    // main container which contain controls
    
     mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
      // Header View Red color
    
    
     headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEADER)];
    [headerView setBackgroundColor:[UIColor colorWithRed:227.0/255.0 green:63.0/255.0 blue:47.0/255.0 alpha:1.0]];
    
      /// header label
    
     headerLbl = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 0.0, kSCREEN_WIDTH-40, kSCREEN_HEADER)];
    [headerLbl setFont:[UIFont fontWithName:@"Arial" size:20.0]];
    [headerLbl setTextColor:[UIColor whiteColor]];
    [headerLbl setText:@"Login/Register"];
     headerLbl.textAlignment = NSTextAlignmentCenter;
    
      // add line header border
     headerline = [[UIView alloc]initWithFrame:CGRectMake(0.0, kSCREEN_HEADER, kSCREEN_WIDTH, 3.0)];
    [headerline setBackgroundColor:[UIColor colorWithRed:139.0/255.0 green:8.0/255.0 blue:8.0/255.0 alpha:1.0]];
    
    
    
    // center view
    
    
     centerView = [[UIView alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+20.0, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT)];
     centerView.layer.cornerRadius = 7;
     centerView.layer.masksToBounds = YES;
    [centerView setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    
    
    
    // Scroll view which contain login container
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10.0, 10.0,centerView.frame.size.width-20, centerView.frame.size.height/1.7)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [scrollView setBackgroundColor:[UIColor clearColor]];
    

    
    
    
    // userNameLbl label of center view
    
    
    
     userNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 0.0, centerView.frame.size.width-40, kSCREEN_HEADER)];
    [userNameLbl setFont:[UIFont fontWithName:@"Arial" size:14.0]];
    [userNameLbl setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:93.0/255.0 alpha:1.0]];
    [userNameLbl setText:@"User Name"];
    [scrollView addSubview:userNameLbl];
    
    // userNameLbl text field of centerview controller
    
    
    
    userNameTxt = [[UITextField alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+10.0, scrollView.frame.size.width-40.0, kSCREEN_HEADER)];
    
    [userNameTxt setBorderStyle:UITextBorderStyleNone];
    [userNameTxt setBackground:[UIImage imageNamed:@"user"]];
    //[userNameTxt setPlaceholder:@"Enter User Name"];
    userNameTxt.font=[UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    userNameTxt.returnKeyType=UIReturnKeyDefault;
    userNameTxt.delegate=self;
    [scrollView addSubview:userNameTxt];
    
    
    // pwdLbl label of center view
    
     pwdLbl = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 2*kSCREEN_HEADER+10.0, centerView.frame.size.width-40, kSCREEN_HEADER)];
    [pwdLbl setFont:[UIFont fontWithName:@"Arial" size:14.0]];
    [pwdLbl setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:93.0/255.0 alpha:1.0]];
    [pwdLbl setText:@"Password"];
    [scrollView addSubview:pwdLbl];
    
    
    
    // pwdTxt text field of centerview controller
    
    
    
    pwdTxt = [[UITextField alloc]initWithFrame:CGRectMake(20.0, 3*kSCREEN_HEADER+10.0, scrollView.frame.size.width-40.0, kSCREEN_HEADER)];
    
    [pwdTxt setBorderStyle:UITextBorderStyleNone];
    [pwdTxt setBackground:[UIImage imageNamed:@"pwd"]];
    
    pwdTxt.secureTextEntry=true;
    //[pwdTxt setPlaceholder:@"Enter Password"];
    pwdTxt.font=[UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    pwdTxt.returnKeyType=UIReturnKeyDefault;
    pwdTxt.delegate=self;
    [scrollView addSubview:pwdTxt];
    
     
    
    // button create for centerview controller
    
    
     loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
     loginBtn.frame = CGRectMake(20.0, 4*kSCREEN_HEADER+20.0, scrollView.frame.size.width-40, kSCREEN_HEADER-15.0);
     loginBtn.tag=1;
    [loginBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
     loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
     loginBtn.layer.cornerRadius = 5;
     loginBtn.layer.masksToBounds = YES;
    [loginBtn setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:54.0/255.0 blue:36.0/255.0 alpha:1.0]];
    [loginBtn addTarget:self action:@selector(AuthenticationClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:loginBtn];
    
    
    // scroller content set here
    scrollView.contentSize = CGSizeMake(centerView.frame.size.width-20, 4*kSCREEN_HEADER+80.0);
    
    
    
    
    forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    forgetPwdBtn.frame = CGRectMake(20.0, centerView.frame.size.height-140.0, (centerView.frame.size.width-40)/2, kSCREEN_HEADER-25.0);
    //forgetPwdBtn.tag=1;
    [forgetPwdBtn.titleLabel setTextColor:[UIColor grayColor]];
    [forgetPwdBtn setTitle:@"Forget Password" forState:UIControlStateNormal];
    forgetPwdBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    forgetPwdBtn.layer.cornerRadius = 5;
    forgetPwdBtn.layer.masksToBounds = YES;
    //[forgetPwdBtn setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:54.0/255.0 blue:36.0/255.0 alpha:1.0]];
    [forgetPwdBtn addTarget:self action:@selector(forgetPwd) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:forgetPwdBtn];
    
    
    
    
    signupBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    signupBtn.frame = CGRectMake(((centerView.frame.size.width-20)/1.5)+10.0, centerView.frame.size.height-140.0, ((centerView.frame.size.width-20)/3)-10, kSCREEN_HEADER-25.0);
    //signupBtn.tag=1;
    signupBtn.titleLabel.textColor = [UIColor redColor];
    [signupBtn setTitle:@"Sign up" forState:UIControlStateNormal];
     signupBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
     signupBtn.layer.cornerRadius = 5;
     signupBtn.layer.masksToBounds = YES;
    //[signupBtn setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:54.0/255.0 blue:36.0/255.0 alpha:1.0]];
    [signupBtn addTarget:self action:@selector(Signup) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:signupBtn];
    
    
    
    
    
    

    fBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fBtn.frame = CGRectMake(20.0, centerView.frame.size.height-105.0, centerView.frame.size.width-40, kSCREEN_HEADER-10.0);
    fBtn.tag=2;
   // [fBtn setImage:[UIImage imageNamed:@"fb"] forState:UIControlStateNormal];
    
    [fBtn setBackgroundImage:[UIImage imageNamed:@"fb"] forState:UIControlStateNormal];
//    [fBtn.titleLabel setTextColor:[UIColor whiteColor]];
//    [fBtn setTitle:@"Facebook" forState:UIControlStateNormal];
//    fBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    fBtn.layer.cornerRadius = 5;
//    fBtn.layer.masksToBounds = YES;
//    [fBtn setBackgroundColor:[UIColor colorWithRed:41.0/255.0 green:71.0/255.0 blue:129.0/255.0 alpha:1.0]];
    [fBtn addTarget:self action:@selector(AuthenticationClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:fBtn];
    
    
     twitterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     twitterBtn.frame = CGRectMake(20.0, centerView.frame.size.height-60.0, centerView.frame.size.width-40, kSCREEN_HEADER-10.0);
     twitterBtn.tag=3;
    //[twitterBtn setImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
    [twitterBtn setBackgroundImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
    //[twitterBtn.titleLabel setTextColor:[UIColor whiteColor]];
    //[twitterBtn setTitle:@"Twitter" forState:UIControlStateNormal];
     //twitterBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
     //twitterBtn.layer.cornerRadius = 5;
     //twitterBtn.layer.masksToBounds = YES;
    //[twitterBtn setBackgroundColor:[UIColor colorWithRed:13.0/255.0 green:180.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [twitterBtn addTarget:self action:@selector(AuthenticationClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:twitterBtn];
    
    
    
    
    
    // ALL CONTROL ADD IN MAINCONTROLLER
    
    [headerView addSubview:headerLbl];
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:centerView];
    [centerView addSubview:scrollView];
    [self.view addSubview:mainContainerView];
    
}


-(IBAction)AuthenticationClick:(id)sender{
    
    UIButton *Authbtn = (UIButton *)sender;
    
    switch (Authbtn.tag) {
            
        case 1:
            
            break;
            
        case 2:
            
            // facebook Authentication here and get response
            
            [self FaceBookAccess];
            
            break;
            
        case 3:
            // Twitter Authentication here and get response
            
            [self TwitterAccess];
            
            break;
            
            
            
        default:
            break;
    }
    
    
}

-(void)TwitterAccess{
    TwitterOAuthViewController * twitterOAuthVC = [[TwitterOAuthViewController alloc] initWithCompletion:^(BOOL succeeded, id object) {
        if (succeeded && object) {
           // [_textView setText:[NSString stringWithFormat:@"%@",object]];
            DLog(@"Twitter Response :- %@",object);
            
        }
    }];
    UINavigationController * navC = [[UINavigationController alloc] initWithRootViewController:twitterOAuthVC];
    [self presentViewController:navC animated:YES completion:NULL];
    

}

// Once the button is clicked, show the login dialog
-(void)FaceBookAccess
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Logged in");
            
            
            
        }
    }];
    
    //    [login logInWithReadPermissions: @[@"public_profile"]
    //     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
    //         if (error) {
    //             NSLog(@"Process error");
    //         } else if (result.isCancelled) {
    //             NSLog(@"Cancelled");
    //         } else {
    //             NSLog(@"Logged in");
    //         }
    //     }];
}


-(void)forgetPwd{
    
}


-(void)Signup{
    
}



# pragma textfield delegate method


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    /*
     
     if (txtFieldSelected==NO) {
     [ConstantIdentifier setViewMovedUp:YES view:self.view];
     txtFieldSelected=YES;
     }
     else if (txtFieldSelected==YES){
     
     [ConstantIdentifier setViewMovedUp:NO view:self.view];
     txtFieldSelected=NO;
     }
     }
     
     
     - (BOOL)textFieldShouldReturn:(UITextField *)textField{
     
     if (txtFieldSelected==YES){
     
     [ConstantIdentifier setViewMovedUp:NO view:self.view];
     txtFieldSelected=NO;
     }
     
     [textField resignFirstResponder];
     
     return YES;
     */
}





@end
