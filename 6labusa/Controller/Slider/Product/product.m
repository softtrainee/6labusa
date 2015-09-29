

#import "product.h"
#import "productdetail.h"
#import "ConstantIdentifier.h"



#import <MFSideMenu/MFSideMenu.h>



@interface product (){
    // view's
    
    UIView *mainContainerView;
    
    
    // UIbutton
    
    UIButton *movetestBtn;
    
    
    
    
    UIButton *LeftMenu;
    
}

@end

@implementation product


-(void)navigationBar{
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
     self.title = @"Product";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
    
     LeftMenu =  [UIButton buttonWithType:UIButtonTypeCustom];
    [LeftMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [LeftMenu setSelected:YES];
    [LeftMenu addTarget:self action:@selector(goLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
    [LeftMenu setFrame:CGRectMake(10, 20, 30, 30)];
    [self.view addSubview:LeftMenu];
    
    
}

- (void)goLeftMenu:(id)sender {
    
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadTV" object:nil];
    
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBar];
    self.navigationController.navigationBarHidden=TRUE;
    
    [self ProductScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ProductScreen{
    // main container which contain controls
    
     mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor greenColor]];
    
    
    
    // close btn
    
    
    movetestBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    movetestBtn.frame = CGRectMake(kSCREEN_WIDTH-65.0, 15.0, kSCREEN_HEADER, kSCREEN_HEADER-25.0);
    //signupBtn.tag=1;
    movetestBtn.titleLabel.textColor = [UIColor whiteColor];
    [movetestBtn setBackgroundColor:[UIColor whiteColor]];
    [movetestBtn setTitle:@"Push" forState:UIControlStateNormal];
    movetestBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    movetestBtn.layer.cornerRadius = 5;
    movetestBtn.layer.masksToBounds = YES;
    [movetestBtn addTarget:self action:@selector(navScreen) forControlEvents:UIControlEventTouchUpInside];
    [mainContainerView addSubview:movetestBtn];
    
    
    
    
    [self.view addSubview:mainContainerView];
    
}



-(void)navScreen{
    productdetail *DetailController =[[productdetail alloc]init];
    [self.navigationController pushViewController:DetailController animated:YES];
}







@end
