

#import "home.h"
#import "ConstantIdentifier.h"

#import "productdetail.h"


#import <MFSideMenu/MFSideMenu.h>





@interface home (){
//    // view's
//    
//    UIView *mainContainerView;
//    
//    
//    UIButton *LeftMenu;
    
    
    
    
    // view's
    
    UIView *mainContainerView;
    
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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self navigationBar];
    self.navigationController.navigationBarHidden=TRUE;
    
    // table view data is being set here
    myData = [[NSMutableArray alloc]initWithObjects:
              @"Home",@"Data 2 in array",@"Data 3 in array",
              @"Data 4 in array",@"Data 5 in array",@"Data 5 in array",
              @"Data 6 in array",@"Data 7 in array",@"Data 8 in array",
              @"Data 9 in array", nil];

    [self HomeScreen];
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
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEIGHT) style:UITableViewStylePlain];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    
    [mainContainerView addSubview:myTableView];
    [self.view addSubview:mainContainerView];
    
    
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
    bgView.image = [UIImage imageNamed:@"Default.png"];
    [cell setBackgroundView:bgView];
    
    NSString *stringForCell;
    
    stringForCell= [myData objectAtIndex:indexPath.row];
    
    
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 180.0;
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Section 1 Header";
    }
    
    return headerTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
(NSInteger)section{
    
    NSString *footerTitle;
    if (section==0) {
        footerTitle = @"Section 1 Footer";
    }
    
    return footerTitle;
    
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    // demo push code
    productdetail *DetailController =[[productdetail alloc]init];
    [self.navigationController pushViewController:DetailController animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%d Row:%d selected and its data is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
    
}









@end
