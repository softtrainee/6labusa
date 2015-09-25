

#import "login.h"
#import "ConstantIdentifier.h"
#import <QuartzCore/QuartzCore.h>

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
    
    
    
    
    
    
    
    // label of center view
    
    
     userNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 10.0, centerView.frame.size.width-40, kSCREEN_HEADER)];
    [userNameLbl setFont:[UIFont fontWithName:@"Arial" size:14.0]];
    [userNameLbl setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:93.0/255.0 alpha:1.0]];
    [userNameLbl setText:@"User Name"];
    [centerView addSubview:userNameLbl];
    
    
    
     pwdLbl = [[UILabel alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+10.0, centerView.frame.size.width-40, kSCREEN_HEADER)];
    [pwdLbl setFont:[UIFont fontWithName:@"Arial" size:14.0]];
    [pwdLbl setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:93.0/255.0 alpha:1.0]];
    [pwdLbl setText:@"Password"];
    [centerView addSubview:pwdLbl];
    
    
    
    // text field of centerview controller
    
    /*
     
    userNameTxt = [[UITextField alloc]initWithFrame:CGRectMake(20.0, lblogin.frame.origin.y+20.0, kSCREEN_WIDTH-40.0, 50.0)];
    [userNameTxt setPlaceholder:@"Enter User Name"];
    userNameTxt.font=[UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    userNameTxt.returnKeyType=UIReturnKeyDefault;
    userNameTxt.delegate=self;
    [centerView addSubview:userNameTxt];
    
    pwdTxt = [[UITextField alloc]initWithFrame:CGRectMake(20.0, lblogin.frame.origin.y+20.0, kSCREEN_WIDTH-40.0, 50.0)];
    [pwdTxt setPlaceholder:@"Enter User Name"];
    pwdTxt.font=[UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    pwdTxt.returnKeyType=UIReturnKeyDefault;
    pwdTxt.delegate=self;
    [centerView addSubview:pwdTxt];
    
     */
    
    // button create for centerview controller
    
    
     loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     loginBtn.frame = CGRectMake(20.0, 210.0, centerView.frame.size.width-40, kSCREEN_HEADER-15.0);
     loginBtn.tag=1;
    [loginBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
     loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
     loginBtn.layer.cornerRadius = 5;
     loginBtn.layer.masksToBounds = YES;
    [loginBtn setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:54.0/255.0 blue:36.0/255.0 alpha:1.0]];
    [loginBtn addTarget:self action:@selector(AuthenticationClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:loginBtn];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    fBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fBtn.frame = CGRectMake(20.0, centerView.frame.size.height-105.0, centerView.frame.size.width-40, kSCREEN_HEADER-15.0);
    fBtn.tag=2;
    [fBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [fBtn setTitle:@"Facebook" forState:UIControlStateNormal];
    fBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    fBtn.layer.cornerRadius = 5;
    fBtn.layer.masksToBounds = YES;
    [fBtn setBackgroundColor:[UIColor colorWithRed:41.0/255.0 green:71.0/255.0 blue:129.0/255.0 alpha:1.0]];
    [fBtn addTarget:self action:@selector(AuthenticationClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:fBtn];
    
    
     twitterBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     twitterBtn.frame = CGRectMake(20.0, centerView.frame.size.height-60.0, centerView.frame.size.width-40, kSCREEN_HEADER-15.0);
     twitterBtn.tag=3;
    [twitterBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [twitterBtn setTitle:@"Twitter" forState:UIControlStateNormal];
     twitterBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
     twitterBtn.layer.cornerRadius = 5;
     twitterBtn.layer.masksToBounds = YES;
    [twitterBtn setBackgroundColor:[UIColor colorWithRed:13.0/255.0 green:180.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [twitterBtn addTarget:self action:@selector(AuthenticationClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:twitterBtn];
    
    
    
    
    
    // ALL CONTROL ADD IN MAINCONTROLLER
    
    [headerView addSubview:headerLbl];
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:centerView];
    [self.view addSubview:mainContainerView];
    
}


-(IBAction)AuthenticationClick:(id)sender{
    
    UIButton *Authbtn = (UIButton *)sender;
    
    switch (Authbtn.tag) {
        case 1:
            
            break;
            
        case 2:
            
            break;
            
        case 3:
            
            break;
            
            
            
        default:
            break;
    }
    
    
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
