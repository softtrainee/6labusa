

#import "home.h"
#import "ConstantIdentifier.h"



#import <MFSideMenu/MFSideMenu.h>





@interface home (){
    // view's
    
    UIView *mainContainerView;
    
    
    UIButton *LeftMenu;
    
    
}

@end

@implementation home


-(void)navigationBar{
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
      self.title = @"Home";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
   // [self.navigationController.navigationBar
   //  setTitleTextAttributes:@{NSBackgroundColorAttributeName : [UIColor redColor]}];
    
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
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

    [self HomeScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)HomeScreen{
    // main container which contain controls
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    [self.view addSubview:mainContainerView];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
