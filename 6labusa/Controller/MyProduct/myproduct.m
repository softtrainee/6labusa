

#import "myproduct.h"
#import "productdetail.h"
#import "ConstantIdentifier.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface myproduct (){
    
    // view's
    
    UIView *mainContainerView;
    
    
    UIView *headerView,*headerline;
    
    
    // header image
    
    UIImageView *headerimg,*headerimg2;
    
    
    // collection view use
    UICollectionView *_collectionView;
    UICollectionViewFlowLayout *layout;
    
    
     NSArray *productImages;
    
    
}

@end

@implementation myproduct


-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self LoadProduct];
}

-(void)LoadProduct{
    
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
    
    
    
    
    /// collection view with flow layout
    
    layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(20.0, 2.5*kSCREEN_HEADER, kSCREEN_WIDTH-40.0, kSCREEN_CENTERVIEWHEIGHT) collectionViewLayout:layout];
    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    

    _collectionView.layer.cornerRadius = 7;
    _collectionView.layer.masksToBounds = YES;
    [_collectionView setBackgroundColor:[UIColor redColor]];
    
    [_collectionView setShowsHorizontalScrollIndicator:NO];
    [_collectionView setShowsVerticalScrollIndicator:NO];
    
    
    
    [_collectionView setShowsHorizontalScrollIndicator:NO];
    [_collectionView setShowsVerticalScrollIndicator:NO];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
  
    
    
    
    
    
    
    
    

    
    

    
   
    [mainContainerView addSubview:headerView];
    [mainContainerView addSubview:headerline];
    [mainContainerView addSubview:_collectionView];
    [self.view addSubview:mainContainerView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.navigationController.navigationBarHidden=TRUE;
        [self ProductScreen];
      productImages = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5", nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return productImages.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *identifier = @"cellIdentifier";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    UIImageView *image =[[UIImageView alloc] initWithFrame:CGRectMake(5,7,80,65)];
    
    
    NSString *tempStr=[[NSString alloc]init];
    
//    NSLog(@"array %@",[[productImages objectAtIndex:0] valueForKey:@"image"]);
    
//    tempStr = [@"http://www.laketahoeluxuryhomerentals.com/img/property/" stringByAppendingString:[[productImages objectAtIndex:indexPath.row] valueForKey:@"image"]];
    
    
       tempStr = [productImages objectAtIndex:indexPath.row];
    
    
    
    NSLog(@"complete url %@",tempStr);
    
    
    
    
    
//    if ([[[myData objectAtIndex:indexPath.row] valueForKey:@"CatImage"] isEqual:[NSNull null]]){
//        
//    }
//    else{
    
    
        
//        [image  sd_setImageWithURL:[NSURL URLWithString:[ImageBaseURL stringByAppendingString:[[productImages objectAtIndex:indexPath.row] valueForKey:@"CatImage"]]] placeholderImage:[UIImage imageNamed:[[productImages objectAtIndex:indexPath.row] valueForKey:@"CatImage"]]];
    
        [cell setBackgroundView:image];
        
//    }
    
    
//    [[JMImageCache sharedCache] imageForURL:[NSURL URLWithString:tempStr] completionBlock:^(UIImage *downloadedImage) {
//        image.image = downloadedImage;
//    }];
//    
//    [cell addSubview:image];
    
    
    

    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myproductbg"]];
    
    
    return cell;
    
    
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(85.0f, 150.0f);
}





- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    productdetail *controller= [[productdetail alloc]init];
    [self.navigationController pushViewController:controller animated:YES];

}


@end
