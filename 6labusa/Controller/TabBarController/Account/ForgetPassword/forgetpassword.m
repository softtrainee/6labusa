

#import "forgetpassword.h"
#import "ConstantIdentifier.h"

#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface forgetpassword (){
    // view's
    
    UIView *mainContainerView;
    UIView *headerView,*headerline;
    UIView *centerView;
    
    
    // Scroll View which contain user info
    
    UIScrollView *scrollView;
    
    
    
    // header image
    
    UIImageView *headerimg,*headerimg2;
    
    
    
    // label's
    
    UILabel *headerLbl;
    UILabel *emailLbl;
    
    // textfield's
    
   
    UITextField *emailTxt;
    
    
    // UIbutton
    
    UIButton *closeBtn;
    UIButton *sendBtn;
    
    
}



@end

@implementation forgetpassword

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self ForgetScreen];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)ForgetScreen{
    
    // main container which contain controls
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    
    // Header View Red color
    
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEADER)];
    [headerView setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1.0]];
    
    
    headerimg = [[[UIImageView alloc]initWithFrame:CGRectMake(10.0, 5.0, 100.0, kSCREEN_HEADER-5.0)]initWithImage:[UIImage imageNamed:@"headerlogo"]];
    headerimg.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:headerimg];
    
    
    headerimg2 = [[[UIImageView alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH-120.0, 5.0, 100.0, kSCREEN_HEADER-5.0)]initWithImage:[UIImage imageNamed:@"asalamwalekum"]];
    headerimg2.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:headerimg2];
    
    // add line header border
    headerline = [[UIView alloc]initWithFrame:CGRectMake(0.0, kSCREEN_HEADER, kSCREEN_WIDTH, 3.0)];
    [headerline setBackgroundColor:[UIColor whiteColor]];
    
    // close btn
    
    
    closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    closeBtn.frame = CGRectMake(kSCREEN_WIDTH-65.0, 15.0, kSCREEN_HEADER, kSCREEN_HEADER-25.0);
    //signupBtn.tag=1;
    closeBtn.titleLabel.textColor = [UIColor whiteColor];
    [closeBtn setBackgroundColor:[UIColor whiteColor]];
    [closeBtn setTitle:@"Close" forState:UIControlStateNormal];
    closeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    closeBtn.layer.cornerRadius = 5;
    closeBtn.layer.masksToBounds = YES;
    [closeBtn addTarget:self action:@selector(Close) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:closeBtn];
    
    
    
    
    // center view
    
    
    centerView = [[UIView alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+20.0, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT)];
    centerView.layer.cornerRadius = 7;
    centerView.layer.masksToBounds = YES;
    [centerView setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    
    
    
    
    
    // Scroll view which contain login container
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN,centerView.frame.size.width-20, centerView.frame.size.height/1.2)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [scrollView setBackgroundColor:[UIColor clearColor]];
    
    
    
    // scroller content set here
    scrollView.contentSize = CGSizeMake(centerView.frame.size.width-20, 4*kSCREEN_HEADER+80.0);
    
    
    
    
    // userNameLbl label of center view
    
    
    
    headerLbl = [[UILabel alloc]initWithFrame:CGRectMake(kLEFT_MARGIN, 0.0, centerView.frame.size.width-40, 2*kSCREEN_HEADER)];
    [headerLbl setFont:[UIFont fontWithName:@"Arial" size:14.0]];
    [headerLbl setBackgroundColor:[UIColor clearColor]];
    [headerLbl setTextAlignment:NSTextAlignmentJustified];
    [headerLbl setNumberOfLines:10];
    [headerLbl setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:93.0/255.0 alpha:1.0]];
    [headerLbl setText:@"Enter your email address below and we'll send you and email with your user-name and instruction to reset your password sholud you wish to."];
    [scrollView addSubview:headerLbl];
    
    
    
    emailLbl = [[UILabel alloc]initWithFrame:CGRectMake(kLEFT_MARGIN, headerLbl.frame.size.height+20.0, centerView.frame.size.width-40, 20.0)];
    [emailLbl setFont:[UIFont fontWithName:@"Arial" size:14.0]];
    [emailLbl setBackgroundColor:[UIColor clearColor]];
    //[emailLbl setTextAlignment:NSTextAlignmentCenter];
    [emailLbl setNumberOfLines:10];
    [emailLbl setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:93.0/255.0 alpha:1.0]];
    [emailLbl setText:@"Enter your email"];
    [scrollView addSubview:emailLbl];
    
    
    
    
    // emailTxt text field of centerview controller
    
    
    
    emailTxt = [[UITextField alloc]initWithFrame:CGRectMake(20.0, 3*kSCREEN_HEADER+kLEFT_MARGIN, scrollView.frame.size.width-40.0, kSCREEN_HEADER-kLEFT_MARGIN)];
    
    [emailTxt setBorderStyle:UITextBorderStyleNone];
    [emailTxt setBackground:[UIImage imageNamed:@"pwd"]];
    
    emailTxt.secureTextEntry=true;
//    [emailTxt setPlaceholder:@"Enter email here"];
    emailTxt.font=[UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    emailTxt.returnKeyType=UIReturnKeyDefault;
    emailTxt.delegate=self;
    [scrollView addSubview:emailTxt];
    
    
    
    
    // button create for centerview controller
    
    
    sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(kLEFT_MARGIN, 4*kSCREEN_HEADER+20.0, scrollView.frame.size.width-20, kSCREEN_HEADER-15.0);
    sendBtn.tag=1;
    [sendBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [sendBtn setTitle:@"SEND USER NAME/PASSWORD" forState:UIControlStateNormal];
    sendBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    sendBtn.titleLabel.font = [UIFont fontWithName:@"arial" size:12.0];
    sendBtn.layer.cornerRadius = 5;
    sendBtn.layer.masksToBounds = YES;
    [sendBtn setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:54.0/255.0 blue:36.0/255.0 alpha:1.0]];
    [sendBtn addTarget:self action:@selector(SendClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:sendBtn];
    
    
    
    
    
    
    
    
    
    
    
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:centerView];
    [centerView addSubview:scrollView];
    [self.view addSubview:mainContainerView];
}



-(void)Close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)SendClick{
    
    
    
    [SVProgressHUD showWithStatus:nil maskType:SVProgressHUDMaskTypeBlack];
    
    // set forget password service
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"Email": @"inform2satishtiwari@gmail.com"};
    NSString *strURL=[BaseURL stringByAppendingString:@"UserForgatepassword"];
    
    
    [manager POST:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSDictionary *dict=responseObject;
        DLog(@"%@", dict);
        [SVProgressHUD dismiss];
        
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              DLog(@"ERROR: %@", error);
              [SVProgressHUD dismiss];
              [SVProgressHUD showErrorWithStatus:InternalError];
          }];

    
    
}



@end
