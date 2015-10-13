

#import "category.h"
#import "ConstantIdentifier.h"

#import "Product/product.h"
#import "myproduct.h"

// network server access file

#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface category (){
    
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

@implementation category


-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=TRUE;
    
    // table view data is being set here
   
    [self CategoryScreen];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self LoadCategory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)CategoryScreen{
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


-(void)setBackgroundScreen{
    
     mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)]initWithImage:[UIImage imageNamed:@"category.jpg"]];
    imgView.contentMode = UIViewContentModeScaleToFill;
    [mainContainerView addSubview:imgView];
    [self.view addSubview:mainContainerView];
    
}


-(void)LoadCategory{
    
    [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = nil;
    NSString *strURL=[BaseURL stringByAppendingString:@"homepageCategory"];
    
    
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
    
    
    
    if ([[[myData objectAtIndex:indexPath.row] valueForKey:@"CategoryName"] isEqual:[NSNull null]]) {
        
    }
    else{
        NSString *stringForCell;
        
        stringForCell= [[myData objectAtIndex:indexPath.row] valueForKey:@"CategoryName"];
        
        
        DLog(@"stringForCell: %@",stringForCell);
        
        [cell.textLabel setText:stringForCell];
    }
    
    
    if ([[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"] isEqual:[NSNull null]]){
        
    }
    else{
        
    
        UIImageView *imageView = [[UIImageView alloc] init];
        
        [imageView setFrame:CGRectMake(10.0, 10.0, 50.0, 50.0)];
        
        
        [cell.imageView  sd_setImageWithURL:[NSURL URLWithString:[ImageBaseURL stringByAppendingString:[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"]]] placeholderImage:[UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"]]];
        
        [cell setBackgroundView:imageView];
        
        
        //    bgView.image = [UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"Imge"]];
        //
        //    [bgView  sd_setImageWithURL:[NSURL URLWithString:[ImageBaseURL stringByAppendingString:[[myData objectAtIndex:indexPath.row] valueForKey:@"Imge"]]] placeholderImage:[UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"Imge"]]];
    }

    
    
  
    
    
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
    
    
    // demo push code
    
    
    myproduct *controller = [[myproduct alloc]init];
//    controller.ProductId = [[myData objectAtIndex:indexPath.row] valueForKey:@"id"];
//    DLog(@"controller.ProductId %@",controller.ProductId);
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%ld Row:%ld selected and its data is %@",
          (long)indexPath.section,(long)indexPath.row,cell.textLabel.text);
    

}






@end
