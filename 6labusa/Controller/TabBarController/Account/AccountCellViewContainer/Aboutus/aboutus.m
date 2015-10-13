

#import "aboutus.h"
#import "ConstantIdentifier.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>



@interface aboutus (){
    // view's
    
    UIView *mainContainerView;
    UIView *headerView,*headerline;
    UIView *centerView;
    
    
    
    
    
    // header image
    
    UIImageView *headerimg,*headerimg2;
    


}

@end

@implementation aboutus

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self AboutDesign];
    
    [self LoadAboutUs];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)AboutDesign{
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
    
    
    
    // center view
    
    
    centerView = [[UIView alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+20.0, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT)];
    centerView.layer.cornerRadius = 7;
    centerView.layer.masksToBounds = YES;
    [centerView setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    
    
    
    
    // ALL CONTROL ADD IN MAINCONTROLLER
    
//    [headerView addSubview:headerLbl];
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:centerView];
    [self.view addSubview:mainContainerView];
    

}


-(void)LoadAboutUs{
    
    [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = nil;
    NSString *strURL=[BaseURL stringByAppendingString:@"CmsApi/About_us"];
    
    
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

@end
