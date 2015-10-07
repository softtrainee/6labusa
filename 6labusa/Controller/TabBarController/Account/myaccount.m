

#import "myaccount.h"
#import "ConstantIdentifier.h"

#import "Login/login.h"
// tablecell controller

#import "blog.h"
#import "contactus.h"
#import "faq.h"
#import "policy.h"
#import "trackorder.h"



@interface myaccount (){
    // view's
    
    UIView *mainContainerView;
    UIView *headerView;
    
    // table
    UITableView *myTableView;
    NSMutableArray *myData;
    
    // button's
    
    UIButton *loginBtn;
    
    
}

@end

@implementation myaccount

#pragma mark - Statusbar

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationController.navigationBarHidden=TRUE;
    // table view data is being set here
    
    myData = [[NSMutableArray alloc]initWithObjects:
              @"Track My Order",@"Contact us",@"Policy",
              @"FAQ'S", nil];
    
    [self AccountScreen];
    
}


-(void)setBackgroundScreen{
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)]initWithImage:[UIImage imageNamed:@"myaccount.jpg"]];
    
    [mainContainerView addSubview:imgView];
    [self.view addSubview:mainContainerView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AccountScreen{
    
    // main container which contain controls
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    
    // Header View Red color
    
    
     headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, 2*kSCREEN_HEADER)];
    [headerView setBackgroundColor:[UIColor redColor]];
    
    
    
    
    
    
    // button create for centerview controller
    
    
    loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(20.0, 20.0, 50.0, 50.0);
    loginBtn.tag=1;
    [loginBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:54.0/255.0 blue:36.0/255.0 alpha:1.0]];
    [loginBtn addTarget:self action:@selector(LoginView) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:loginBtn];
    
    
    
//    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(kLEFT_MARGIN, 2*kSCREEN_HEADER, kSCREEN_WIDTH-20.0, kSCREEN_HEIGHT) style:UITableViewStyleGrouped];
//    
    
   myTableView = [[UITableView alloc]initWithFrame:CGRectMake(20.0, 2.5*kSCREEN_HEADER, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT) style:UITableViewStylePlain];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    myTableView.layer.cornerRadius = 7;
    myTableView.layer.masksToBounds = YES;
    [myTableView setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    
    [myTableView setShowsHorizontalScrollIndicator:NO];
    [myTableView setShowsVerticalScrollIndicator:NO];
    
    
    
    
    
    
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:myTableView];
    [self.view addSubview:mainContainerView];
    
}

-(void)LoginView{
    login *controller = [[login alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    
    return [myData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [cell setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    NSString *stringForCell;
    
    stringForCell= [myData objectAtIndex:indexPath.row];
    
    
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}





#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id controller;
    
    
    switch (indexPath.row) {
        case 0:
              controller = [[trackorder alloc]init];
              [self.navigationController pushViewController:controller animated:NO];
            break;
            
        case 1:
            controller = [[contactus alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            break;
            
        case 2:
            controller = [[policy alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            break;
            
        case 3:
            controller = [[faq alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            break;
            
        case 4:
            controller = [[blog alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            break;
            
        default:
            break;
    }
    
   
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%d Row:%d selected and its data is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
    
}



@end
