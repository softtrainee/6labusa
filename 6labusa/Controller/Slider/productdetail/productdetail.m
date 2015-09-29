
#import "productdetail.h"
#import "ConstantIdentifier.h"

@interface productdetail (){
    // view's
    
    UIView *mainContainerView;
    
}

@end

@implementation productdetail


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self ProductDetailScreen];
    
}


-(void)ProductDetailScreen
{
    
    // main container which contain controls
    
    mainContainerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 20.0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    [mainContainerView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:mainContainerView];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
