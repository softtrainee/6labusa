

#import "myaccount.h"
#import "ConstantIdentifier.h"


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
}

@end

@implementation myaccount

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//     self.navigationController.navigationBarHidden=TRUE;
    // table view data is being set here
    
    myData = [[NSMutableArray alloc]initWithObjects:
              @"Track My Order",@"Contact us",@"Policy",
              @"FAQ'S",@"Blog", nil];
    
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
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]];
    
    
    // Header View Red color
    
    
     headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, kSCREEN_WIDTH, 2*kSCREEN_HEADER)];
    [headerView setBackgroundColor:[UIColor redColor]];
    
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(10.0, 2*kSCREEN_HEADER, kSCREEN_WIDTH-20.0, kSCREEN_HEIGHT) style:UITableViewStyleGrouped];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    
    
    
    
    
    [mainContainerView addSubview:headerView];
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
