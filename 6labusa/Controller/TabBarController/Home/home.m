

#import "home.h"
#import "ConstantIdentifier.h"

#import "productlist.h"
#import "productview.h"

#import "productdetail.h"
#import "nearmosque.h"
#import "blog.h"

#import <MFSideMenu/MFSideMenu.h>

#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>







@interface home (){
    
//    // view's
//    
//    UIView *mainContainerView;
//    
//    
//    UIButton *LeftMenu;
    
    
    
    
    // view's
    
    UIView *mainContainerView;
    UIView *headerView,*headerline;
    
    
    // header image
    
    
    
    UIImageView *headerimg,*headerimg2;
    
    
    // table
    UITableView *myTableView;
    NSMutableArray *myData;
    
    
    
    
}

@end

@implementation home

/*
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
 */


-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self navigationBar];
    self.navigationController.navigationBarHidden=TRUE;
    
    // table view data is being set here
   

    [self HomeScreen];
}

-(void)viewWillAppear:(BOOL)animated{
    [self LoadServerData];
}



-(void)setBackgroundScreen{
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0.0, 60.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)]initWithImage:[UIImage imageNamed:@"home.jpg"]];
    
    [mainContainerView addSubview:imgView];
    [self.view addSubview:mainContainerView];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)HomeScreen{
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
    
    
    
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0, kSCREEN_HEADER+5.0, kSCREEN_WIDTH, kSCREEN_HEIGHT) style:UITableViewStylePlain];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    [myTableView setShowsHorizontalScrollIndicator:NO];
    [myTableView setShowsVerticalScrollIndicator:NO];
    
    
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:myTableView];
    [self.view addSubview:mainContainerView];
    
    
}


-(void)LoadServerData{
    
    [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = nil;
    NSString *strURL=[BaseURL stringByAppendingString:@"AppsMenu"];
    
    
    [manager GET:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        
        myData = [[NSMutableArray alloc]initWithArray:responseObject];
        
        
        DLog(@"%@", myData);
        [SVProgressHUD dismiss];
        [myTableView reloadData];
        
        
        
    }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             DLog(@"ERROR: %@", error);
             [SVProgressHUD dismiss];
             [SVProgressHUD showErrorWithStatus:InternalError];
         }];

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
    }
    
    
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:cell.backgroundView.frame];
    [bgView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
     bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//     bgView.image = [UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"menuIamge"]];
    
    [bgView  sd_setImageWithURL:[NSURL URLWithString:[ImageBaseURL stringByAppendingString:[[myData objectAtIndex:indexPath.row] valueForKey:@"menuIamge"]]] placeholderImage:[UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"menuIamge"]]];
    
    
    UIButton *customBtn;
    
    customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBtn setFrame:CGRectMake(0.0, 110.0, cell.frame.size.width, 50.0)];
      customBtn.tag=indexPath.row;
    [customBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [customBtn setTitle:[[myData objectAtIndex:indexPath.row] valueForKey:@"MenuName"] forState:UIControlStateNormal];
     customBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [customBtn setBackgroundImage:[UIImage imageNamed:@"btnbg"] forState:UIControlStateNormal];
    
    [customBtn setBackgroundColor:[UIColor clearColor]];
    [customBtn addTarget:self action:@selector(CellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:customBtn];
   

    [cell setBackgroundView:bgView];
    
    
    
//    NSString *stringForCell;
//    
//    stringForCell= [[myData objectAtIndex:indexPath.row] valueForKey:@"MenuName"];
//    
//    
//    [cell.textLabel setText:stringForCell];
    
    
    
    
    return cell;
}


-(IBAction)CellBtnClick:(id)sender{
    
}


// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 180.0;
    
    
}



#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    id controller ;
//    UIAlertView *alert;
    
    switch (indexPath.row) {
        case 0:
            
             controller =[[blog alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            
            break;
            
            
            
          case 1:
            
//            alert = [[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"1" otherButtonTitles:@"2", nil];
//            
//            [alert show];
            
            controller =[[productlist alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            
            
            
            
            break;
        case 2:
            
            controller =[[productview alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
            
            break;
            
        default:
            break;
    }
    
    // demo push code
    

    
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"Section:%ld Row:%ld selected and its data is %@",
//          (long)indexPath.section,(long)indexPath.row,cell.textLabel.text);
    
    
    
    
    
    
}









@end
