

#import <UIKit/UIKit.h>

@interface login : UIViewController<UITextFieldDelegate>


// Login Authentication

-(IBAction)AuthenticationClick:(id)sender;
-(void)forgetPwd;
-(void)Signup;
-(void)TwitterAccess;
-(void)FaceBookAccess;

@end
