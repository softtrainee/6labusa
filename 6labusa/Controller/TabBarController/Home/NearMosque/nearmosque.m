
#import "nearmosque.h"
#import "ConstantIdentifier.h"



// google place PI data load


#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>




@interface nearmosque (){
    // view's
    
    UIView *mainContainerView;
    
    
    UIView *headerView,*headerline;
    
    int currenDist;

    
    // header image
    
    UIImageView *headerimg,*headerimg2;
    
    // table
    UITableView *myTableView;
    NSMutableArray *myData;
    
    
}

@end

@implementation nearmosque

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=TRUE;
    
    // table view data is being set here
    
    [self NearMosqueScreen];
   
    
    [NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(LoadMosque) userInfo:nil repeats:NO];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)NearMosqueScreen{
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


-(void)LoadMosque{
    
    
    NSString *buttonTitle = @"mosque";
    
    //Use this title text to build the URL query and get the data from Google. Change the radius value to increase the size of the search area in meters. The max is 50,000.
    [self queryGooglePlaces:buttonTitle];
    
}





#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    
    return [myData count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0;
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
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [imageView setFrame:CGRectMake(10.0, 10.0, 50.0, 50.0)];
    
    
    [cell.imageView  sd_setImageWithURL:[NSURL URLWithString:[[myData objectAtIndex:indexPath.row] valueForKey:@"icon"]] placeholderImage:[UIImage imageNamed:[[myData objectAtIndex:indexPath.row] valueForKey:@"icon"]]];
    
    [cell setBackgroundView:imageView];
    
    
    
    
    
    NSString *stringForCell;
    
    stringForCell= [[myData objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    
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
    
    
    // demo push code
    
    
  
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%ld Row:%ld selected and its data is %@",
          (long)indexPath.section,(long)indexPath.row,cell.textLabel.text);
    
    
}




-(void) queryGooglePlaces: (NSString *) googleType
{
    
    
    [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
    
    
    // Build the url string we are going to sent to Google. NOTE: The kGOOGLE_API_KEY is a constant which should contain your own API key that you can obtain from Google. See this link for more info:
    
    
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=%@&types=%@&key=%@",28.621767,77.055846,[NSString stringWithFormat:@"%i",5000],googleType,kGOOGLE_API_KEY];
    
    
    
    
    
    //Formulate the string as URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
        
        
        //[SVProgressHUD showErrorWithStatus:InternalError];
    });
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
    
    myData =[[NSMutableArray alloc]initWithArray:[json objectForKey:@"results"]];
    [myTableView reloadData];
    NSLog(@"Google json: %@", json);
    
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
    
    
     NSLog(@"vicinity json: %@", [myData valueForKey:@"vicinity"]);
    
    [SVProgressHUD dismiss];
    
    //Plot the data in the places array onto the map with the plotPostions method.
   
    
    
}






@end
