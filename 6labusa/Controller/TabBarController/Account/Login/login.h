

#import <UIKit/UIKit.h>

@interface login : UIViewController<UITextFieldDelegate>


// Login Authentication

-(void)LoginScreen;
-(IBAction)AuthenticationClick:(id)sender;
-(void)forgetPwd;
-(void)Signup;
-(void)LoginAccess;
-(void)TwitterAccess;
-(void)FaceBookAccess;

@end
