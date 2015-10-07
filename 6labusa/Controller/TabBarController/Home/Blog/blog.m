

#import "blog.h"
#import "ConstantIdentifier.h"




@interface blog (){
    // view's
    
    UIView *mainContainerView;
    

    UIView *headerView,*headerline;
    
    // web view
    
    UIWebView *webview;
    
    // header image
    
    UIImageView *headerimg,*headerimg2;
}

@end

@implementation blog


-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self BlogDesign];
    
}


-(void)BlogDesign{
    
    
    // main container which contain controls
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    // Header View Red color
    
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEADER)];
    [headerView setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1.0]];
    
    
    headerimg = [[[UIImageView alloc]initWithFrame:CGRectMake(5.0, 5.0, 100.0, kSCREEN_HEADER-5.0)]initWithImage:[UIImage imageNamed:@"headerlogo"]];
    headerimg.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:headerimg];
    
    
    headerimg2 = [[[UIImageView alloc]initWithFrame:CGRectMake(130.0, 5.0, 100.0, kSCREEN_HEADER-5.0)]initWithImage:[UIImage imageNamed:@"asalamwalekum"]];
    headerimg2.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:headerimg2];
    
    // add line header border
    headerline = [[UIView alloc]initWithFrame:CGRectMake(0.0, kSCREEN_HEADER, kSCREEN_WIDTH, 3.0)];
    [headerline setBackgroundColor:[UIColor whiteColor]];
    
    
    // center view
    
    
    webview = [[UIWebView alloc]initWithFrame:CGRectMake(10.0, kSCREEN_HEADER+10.0, kSCREEN_WIDTH-20.0, kSCREEN_CENTERVIEWHEIGHT+10.0)];
    webview.layer.cornerRadius = 7;
    webview.layer.masksToBounds = YES;
    webview.scrollView.showsHorizontalScrollIndicator = NO;
    webview.scrollView.showsVerticalScrollIndicator = NO;
    [webview setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    NSURL *nsurl=[NSURL URLWithString:BlockURL];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webview loadRequest:nsrequest];

    
    
    
    [mainContainerView addSubview:webview];
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [self.view addSubview:mainContainerView];
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
