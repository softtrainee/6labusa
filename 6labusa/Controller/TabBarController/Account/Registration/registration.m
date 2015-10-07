

#import "registration.h"
#include "ConstantIdentifier.h"

@interface registration ()
{
    // view's
    
    UIView *mainContainerView;
    UIView *headerView,*headerline;
    UIView *centerView;
    
    
    // UIbutton
    
    UIButton *closeBtn;
    UIButton *BtnCountry;
    UIButton *BtnState;
    UIButton *BtnChechUncheckTC;
    
    // Scroll View which contain user info
    
    UIScrollView *scrollView;
    
    UITextField *txtFname;
    UITextField *txtLname;
    UITextField *txtEmail;
    UITextField *txtPwd;
    UITextField *txtAddress;
    UITextField *txtZipCode;
    UITextField *txtPhone;
    
}


@end

@implementation registration

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self RegistrationScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Statusbar

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}



-(void)RegistrationScreen{
    
    // main container which contain controls
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    
    // Header View Red color
    
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEADER)];
    [headerView setBackgroundColor:[UIColor colorWithRed:227.0/255.0 green:63.0/255.0 blue:47.0/255.0 alpha:1.0]];
    
    
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
    
    
    // add line header border
    headerline = [[UIView alloc]initWithFrame:CGRectMake(0.0, kSCREEN_HEADER, kSCREEN_WIDTH, 3.0)];
    [headerline setBackgroundColor:[UIColor colorWithRed:139.0/255.0 green:8.0/255.0 blue:8.0/255.0 alpha:1.0]];
    
    
    
    // center view
    
    
    centerView = [[UIView alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+20.0, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT)];
    centerView.layer.cornerRadius = 7;
    centerView.layer.masksToBounds = YES;
    [centerView setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    
    
    
    
    
    // Scroll view which contain login container
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN,centerView.frame.size.width-20, 3*kSCREEN_HEIGHT)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [scrollView setBackgroundColor:[UIColor grayColor]];
    
    
    
    // textfiled contain by scrollview
    
    [self customTxtCreate];
    
    
    
    
    
    
    
    
    
    
    
    
    // scroller content set here
    scrollView.contentSize = CGSizeMake(centerView.frame.size.width-20, 2*kSCREEN_HEIGHT);
    
    
    
    
    
    
    // header's add in maincontroller
    
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:centerView];
    [centerView addSubview:scrollView];
    [self.view addSubview:mainContainerView];
}



-(void)customTxtCreate{
    
    txtFname = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtFname.borderStyle = UITextBorderStyleRoundedRect;
    txtFname.font = [UIFont systemFontOfSize:15];
    txtFname.placeholder = @"First Name";
    txtFname.autocorrectionType = UITextAutocorrectionTypeNo;
    txtFname.keyboardType = UIKeyboardTypeDefault;
    txtFname.returnKeyType = UIReturnKeyDone;
    txtFname.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtFname.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtFname.delegate = self;
    [scrollView addSubview:txtFname];
    
    
    txtLname = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+2*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtLname.borderStyle = UITextBorderStyleRoundedRect;
    txtLname.font = [UIFont systemFontOfSize:15];
    txtLname.placeholder = @"Last Name";
    txtLname.autocorrectionType = UITextAutocorrectionTypeNo;
    txtLname.keyboardType = UIKeyboardTypeDefault;
    txtLname.returnKeyType = UIReturnKeyDone;
    txtLname.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtLname.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtLname.delegate = self;
    [scrollView addSubview:txtLname];
    
    
    
    
    
    txtEmail = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+3*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtEmail.borderStyle = UITextBorderStyleRoundedRect;
    txtEmail.font = [UIFont systemFontOfSize:15];
    txtEmail.placeholder = @"Email";
    txtEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    txtEmail.keyboardType = UIKeyboardTypeDefault;
    txtEmail.returnKeyType = UIReturnKeyDone;
    txtEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtLname.delegate = self;
    [scrollView addSubview:txtEmail];
    
    
    
    
    txtPwd = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+4*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtPwd.borderStyle = UITextBorderStyleRoundedRect;
    txtPwd.font = [UIFont systemFontOfSize:15];
    txtPwd.placeholder = @"Password";
    txtPwd.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPwd.keyboardType = UIKeyboardTypeDefault;
    txtPwd.returnKeyType = UIReturnKeyDone;
    txtPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPwd.secureTextEntry=YES;
    txtPwd.delegate = self;
    [scrollView addSubview:txtPwd];
    
    
    
    
    txtAddress = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+5*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtAddress.borderStyle = UITextBorderStyleRoundedRect;
    txtAddress.font = [UIFont systemFontOfSize:15];
    txtAddress.placeholder = @"Address";
    txtAddress.autocorrectionType = UITextAutocorrectionTypeNo;
    txtAddress.keyboardType = UIKeyboardTypeDefault;
    txtAddress.returnKeyType = UIReturnKeyDone;
    txtAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtAddress.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtAddress.secureTextEntry=YES;
    [scrollView addSubview:txtAddress];
    
    
    
    
    txtZipCode = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+6*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtZipCode.borderStyle = UITextBorderStyleRoundedRect;
    txtZipCode.font = [UIFont systemFontOfSize:15];
    txtZipCode.placeholder = @"Zip Code";
    txtZipCode.autocorrectionType = UITextAutocorrectionTypeNo;
    txtZipCode.keyboardType = UIKeyboardTypeDefault;
    txtZipCode.returnKeyType = UIReturnKeyDone;
    txtZipCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtZipCode.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtZipCode.secureTextEntry=YES;
    [scrollView addSubview:txtZipCode];
    
    
    
    
    txtPhone = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+7*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtPhone.borderStyle = UITextBorderStyleRoundedRect;
    txtPhone.font = [UIFont systemFontOfSize:15];
    txtPhone.placeholder = @"Phone";
    txtPhone.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPhone.keyboardType = UIKeyboardTypeDefault;
    txtPhone.returnKeyType = UIReturnKeyDone;
    txtPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPhone.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPhone.secureTextEntry=YES;
    [scrollView addSubview:txtPhone];
    
    
    
    
    
    
    
    
    // Country btn
    
    
    BtnCountry = [UIButton buttonWithType:UIButtonTypeSystem];
    BtnCountry.frame = CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+8*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT);
    //signupBtn.tag=1;
    BtnCountry.titleLabel.textColor = [UIColor whiteColor];
    [BtnCountry setBackgroundColor:[UIColor whiteColor]];
    [BtnCountry setTitle:@"Country" forState:UIControlStateNormal];
    BtnCountry.titleLabel.textAlignment = NSTextAlignmentCenter;
    BtnCountry.layer.cornerRadius = 5;
    BtnCountry.layer.masksToBounds = YES;
    [BtnCountry addTarget:self action:@selector(Close) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:BtnCountry];
    
    
    
    // State btn
    
    
    BtnState = [UIButton buttonWithType:UIButtonTypeSystem];
    BtnState.frame = CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+9*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT);
    //signupBtn.tag=1;
    BtnState.titleLabel.textColor = [UIColor whiteColor];
    [BtnState setBackgroundColor:[UIColor whiteColor]];
    [BtnState setTitle:@"State" forState:UIControlStateNormal];
    BtnState.titleLabel.textAlignment = NSTextAlignmentCenter;
    BtnState.layer.cornerRadius = 5;
    BtnState.layer.masksToBounds = YES;
    [BtnState addTarget:self action:@selector(Close) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:BtnState];
    
    
    
    
    
//    // Term & Condition Check Uncheck btn
//    
//    
//    BtnChechUncheckTC = [UIButton buttonWithType:UIButtonTypeSystem];
//    BtnChechUncheckTC.frame = CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+kLEFT_MARGIN*kTXT_HEIGHT, 20.0, 2*kLEFT_MARGIN);
//    //signupBtn.tag=1;
//    BtnChechUncheckTC.titleLabel.textColor = [UIColor whiteColor];
//    [BtnChechUncheckTC setBackgroundColor:[UIColor whiteColor]];
////    [BtnChechUncheckTC setTitle:@"Close" forState:UIControlStateNormal];
//    BtnChechUncheckTC.titleLabel.textAlignment = NSTextAlignmentCenter;
//    BtnChechUncheckTC.layer.cornerRadius = 5;
//    BtnChechUncheckTC.layer.masksToBounds = YES;
//    [BtnChechUncheckTC addTarget:self action:@selector(BtnCheckUnCheck:) forControlEvents:UIControlEventTouchUpInside];
//    [scrollView addSubview:BtnChechUncheckTC];
    
    
    
    
    
    
}


-(void)Close{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(IBAction)BtnCheckUnCheck:(id)sender{
    
}


@end
