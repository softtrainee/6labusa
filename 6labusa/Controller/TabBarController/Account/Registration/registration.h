

#import <UIKit/UIKit.h>

@interface registration : UIViewController<UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>

-(void)RegistrationScreen;
-(IBAction)BtnCheckUnCheck:(id)sender;
-(IBAction)RegisterClick:(id)sender;
-(void)RegisterAccess;
-(IBAction)GetCountryStateApi:(id)sender;
-(void)Close;

// use for get image from camera and library
-(void)changeOrAddpic;

@end
