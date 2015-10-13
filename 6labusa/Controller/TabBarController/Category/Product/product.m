

#import "product.h"
#import "productdetail.h"
#import "ConstantIdentifier.h"



#import <MFSideMenu/MFSideMenu.h>

// network server access

#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>



@interface product (){

    
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

@implementation product
@synthesize ProductId;

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}

/*
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
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.navigationController.navigationBarHidden=TRUE;
    
    [self ProductScreen];
    [self ProductLoadByApi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ProductScreen{
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
    
    
    
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(20.0, kSCREEN_HEADER+20.0, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT) style:UITableViewStylePlain];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    myTableView.layer.cornerRadius = 7;
    myTableView.layer.masksToBounds = YES;
    [myTableView setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:252.0/255.0 alpha:1.0]];
    
    [myTableView setShowsHorizontalScrollIndicator:NO];
    [myTableView setShowsVerticalScrollIndicator:NO];
    
    
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:myTableView];
    [self.view addSubview:mainContainerView];

    
}



-(void)navScreen{
    productdetail *DetailController =[[productdetail alloc]init];
    [self.navigationController pushViewController:DetailController animated:YES];
}



-(void)ProductLoadByApi{
    [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = nil;
    
//    NSString *strURL=[BaseURL stringByAppendingString:[@"CategorywiseProduct/?id=%@" stringByAppendingString:ProductId]];
    
    NSString *strURL = [BaseURL stringByAppendingFormat:@"CategorywiseProduct/?id=%@",ProductId];
    
    
    [manager GET:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        
//        myData = [[NSMutableArray alloc]initWithArray:responseObject];
        
        
        DLog(@"%@", responseObject);
        [SVProgressHUD dismiss];
//        [myTableView reloadData];
        
        
        
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
    
    
    
//    if ([[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"] isEqual:[NSNull null]]){
//        
//    }
//    else{
//        
//        
//        UIImageView *imageView = [[UIImageView alloc] init];
//        
//        [imageView setFrame:CGRectMake(10.0, 10.0, 50.0, 50.0)];
//        
//        
//        [cell.imageView  sd_setImageWithURL:[NSURL URLWithString:[ImageBaseURL stringByAppendingString:[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"]]] placeholderImage:[UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"]]];
//        
//        [cell setBackgroundView:imageView];
//        
//
//    }
//    
    
    
    NSString *stringForCell;
    
    stringForCell= @"ProductName";
    
    
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 80.0;
    
    
}



#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%ld Row:%ld selected and its data is %@",
          (long)indexPath.section,(long)indexPath.row,cell.textLabel.text);
    
    
}





@end
