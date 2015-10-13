

#import "registration.h"
#include "ConstantIdentifier.h"


// network aur server purpose

#import <AFNetworking.h>
#import <SVProgressHUD.h>



@interface registration (){
    // view's
    
    UIView *mainContainerView;
    UIView *headerView,*headerline;
    UIView *centerView;
    
    
    // header image
    
    UIImageView *headerimg,*headerimg2;
    UIImageView *profileImageView;
    
    // UIbutton
    
    UIButton *closeBtn;
    UIButton *BtnCountry;
    UIButton *BtnState;
    UIButton *BtnChechUncheckTC;
    UIButton *BtnRegisterNewAccount;
    
    
    
    // Scroll View which contain user info
    
    UIScrollView *scrollView;

    
    UITextField *txtFname;
    UITextField *txtLname;
    UITextField *txtEmail;
    UITextField *txtPwd;
    UITextField *txtAddress;
    UITextField *txtZipCode;
    UITextField *txtPhone;
    UITextField *txtCity;
    
    
    
    // uipicker
    
    
    UIPickerView *CountryPicker,*StatePicker;
    NSMutableArray *CountryPickerData,*StatePickerData;
    
    
    
    NSData *imageData;
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
    
    

    
    
   
    
    [self customTxtCreate];
    
    
    
    
    
    
    // scroller content set here
    scrollView.contentSize = CGSizeMake(centerView.frame.size.width-20, 2*kSCREEN_HEIGHT);
    
    
    // account register button
    
    
    BtnRegisterNewAccount = [UIButton buttonWithType:UIButtonTypeSystem];
    BtnRegisterNewAccount.frame = CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+9*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT);
    //signupBtn.tag=1;
    BtnRegisterNewAccount.titleLabel.textColor = [UIColor whiteColor];
    [BtnRegisterNewAccount setBackgroundColor:[UIColor whiteColor]];
    [BtnRegisterNewAccount setTitle:@"State" forState:UIControlStateNormal];
    BtnRegisterNewAccount.titleLabel.textAlignment = NSTextAlignmentCenter;
    BtnRegisterNewAccount.layer.cornerRadius = 5;
    BtnRegisterNewAccount.layer.masksToBounds = YES;
    [BtnRegisterNewAccount addTarget:self action:@selector(Close) forControlEvents:UIControlEventTouchUpInside];
    [mainContainerView addSubview:BtnRegisterNewAccount];
    
    
    
    
    
    
    
    // header's add in maincontroller
    
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:centerView];
    [centerView addSubview:scrollView];
    [self.view addSubview:mainContainerView];
    
}



-(void)customTxtCreate{
    
    
    
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
    
    
    
    
    
    txtCity = [[UITextField alloc] initWithFrame:CGRectMake(kLEFT_MARGIN, kLEFT_MARGIN+7*kTXT_HEIGHT, scrollView.frame.size.width-20.0, kTXT_HEIGHT)];
    txtCity.borderStyle = UITextBorderStyleRoundedRect;
    txtCity.font = [UIFont systemFontOfSize:15];
    txtCity.placeholder = @"City";
    txtCity.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCity.keyboardType = UIKeyboardTypeDefault;
    txtCity.returnKeyType = UIReturnKeyDone;
    txtCity.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtCity.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtCity.secureTextEntry=YES;
    [scrollView addSubview:txtCity];
    
    
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


-(void)PickerIntizlize{
    
    
    CountryPickerData= [[NSMutableArray alloc] initWithObjects:@"English",@"Spanish",@"French",@"Greek",
                 @"Japaneese",@"Korean",@"Hindi", nil];
    CountryPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 200, 300, 200)];
    CountryPicker.showsSelectionIndicator = YES;
    CountryPicker.hidden = NO;
    CountryPicker.delegate = self;
    
    
    
    
    
    
    StatePickerData= [[NSMutableArray alloc] initWithObjects:@"English",@"Spanish",@"French",@"Greek",
                        @"Japaneese",@"Korean",@"Hindi", nil];
    StatePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 200, 300, 200)];
    StatePicker.showsSelectionIndicator = YES;
    StatePicker.hidden = NO;
    StatePicker.delegate = self;
    
    
    
    
}

//Columns in picker views

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
//Rows in each Column

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    return 7;
}


// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [CountryPickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    //Write the required logic here that should happen after you select a row in Picker View.
}







-(void)Close{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(IBAction)BtnCheckUnCheck:(id)sender{
    
}




-(IBAction)RegisterClick:(id)sender{
    
    if ([txtFname.text isEqualToString:@""]==TRUE) {
        
        [ConstantIdentifier getAlert:@"FirstName can not be empty." view:self];
    }
    else if ([txtLname.text isEqualToString:@""]==TRUE){
        
        [ConstantIdentifier getAlert:@"LastName can not be empty." view:self];
    }
   
    else if ([txtEmail.text isEqualToString:@""]==TRUE){
        
        [ConstantIdentifier getAlert:@"Email Id can not be empty." view:self];
    }
    else if (![self validateEmailWithString:txtEmail.text]){
        [ConstantIdentifier getAlert:@"Please enter a valid email." view:self];
    }
    else if ([txtPhone.text isEqualToString:@""]==TRUE){
        
        [ConstantIdentifier getAlert:@"Phone Number can not be empty." view:self];
    }
    else if ([txtPwd.text isEqualToString:@""]==TRUE){
        
        [ConstantIdentifier getAlert:@"Password can not be empty." view:self];
    }
    else if ([txtAddress.text isEqualToString:@""]==TRUE){
        
        [ConstantIdentifier getAlert:@"Password can not be empty." view:self];
    }
    else if ([txtZipCode.text isEqualToString:@""]==TRUE){
        
        [ConstantIdentifier getAlert:@"Password can not be empty." view:self];
    }
    else
        if([ConstantIdentifier checkNetworkConnection]){
            
            [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
            
            [self performSelector:@selector(RegisterAccess) withObject:self afterDelay:10.0];
            
        }
        else{
            
            [ConstantIdentifier getAlert:InternetMessage view:self];
        }
    
    
    
}


- (BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void)RegisterAccess{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSDictionary *parameters = @{@"Fname": txtFname.text, @"Lname": txtLname.text, @"Email": txtEmail.text, @"img": @"", @"Password": txtPwd.text, @"Address1": txtAddress.text, @"Address2": @"", @"Country": BtnCountry.titleLabel.text, @"State": BtnState.titleLabel.text, @"City": txtCity.text, @"ZipCode": txtZipCode.text, @"Phone": txtPhone.text};
    
    NSString *strURL=[BaseURL stringByAppendingString:@"UserRegistration"];
    
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

-(IBAction)GetCountryStateApi:(id)sender{
    
    UIButton *tempBtn=(UIButton *)sender;
    
    [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *strURL;
    
    NSDictionary *parameters = nil;
    
    
    switch (tempBtn.tag) {
            
        case 1:
              strURL=[BaseURL stringByAppendingString:@"/country"];
            break;
            
        case 2:
              strURL=[BaseURL stringByAppendingString:[@"/State/" stringByAppendingString:@""]];
            break;
            
        default:
            break;
    }
    
    
    [manager GET:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        DLog(@"%@", responseObject);
        [SVProgressHUD dismiss];
        
    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             DLog(@"ERROR: %@", error);
             [SVProgressHUD dismiss];
             [SVProgressHUD showErrorWithStatus:InternalError];
    }];

}





-(void)changeOrAddpic{
    
    UIActionSheet* actionSheet;
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:nil
                                     otherButtonTitles:@"Take Photo",@"Choose Existing",
                   nil];
    
    //[actionSheet showFromTabBar:self.tabBarController.tabBar];
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            [self Open_Camera];
            break;
        case 1:
            [self Open_Library];
            
            break;
        default:
            break;
    }
}

-(void)Open_Camera{
    
    NSString *model = [[UIDevice currentDevice] model];
    
    if ([model isEqualToString:@"iPhone Simulator"] || [model isEqualToString:@"iPad Simulator"]){
        
        [[[UIAlertView alloc] initWithTitle:@"Angry!!!" message:@"No Camera found!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
    else
    {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate=self;
        picker.allowsEditing = NO;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController: picker animated:YES completion:NULL];
        
    }
}

-(void)Open_Library{
    
    // Create image picker controller
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // Set source to the camera
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate=self;
    imagePicker.navigationBar.tintColor=[UIColor blackColor];
    // Delegate is self
    
    // Allow editing of image ?
    imagePicker.allowsEditing = YES;
    // Show image picker

        [self presentViewController:imagePicker animated:YES completion:nil];
   
}



-(void)selectphoto{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editingInfo
{
    [self dismissModalViewControllerAnimated:YES];
    profileImageView.image = [editingInfo valueForKey:@"UIImagePickerControllerOriginalImage"];
    //DLog(@"%@",profileImageView);
    if(profileImageView==nil)
    {
        [[[UIAlertView alloc] initWithTitle:@"Angry!!!" message:@"No Image Found!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        
    }
    else
    {
        imageData=[self compressImage:img];
        profileImageView.image=img;
        
        [picker dismissModalViewControllerAnimated:YES];
        
    }
    return;
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



-(NSData *)compressImage:(UIImage *)image1 {
    
    float actualHeight = image1.size.height;
    float actualWidth = image1.size.width;
    float maxHeight = 500.0; //new max. height for image
    float maxWidth = 500.0; //new max. width for image
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 0.5; //50 percent compression
    
    if (actualHeight > maxHeight || actualWidth > maxWidth){
        if(imgRatio < maxRatio){
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight;
            actualWidth = maxWidth;//imgRatio * actualWidth;
            actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio){
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth;
            actualHeight = maxHeight;//imgRatio * actualHeight;
            actualWidth = maxWidth;
        }
        else{
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
        NSLog(@"Actual height :%f and Width :%f",actualHeight,actualWidth);
        CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
        UIGraphicsBeginImageContext(rect.size);
        [image1 drawInRect:rect];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        imageData = UIImageJPEGRepresentation(img, compressionQuality);
        UIGraphicsEndImageContext();
        
        
    }
    else{
        
        [ConstantIdentifier getAlert:@"Image is too small.Image Size should be 500x500" view:self];
        
    }
    return imageData;
}














@end
