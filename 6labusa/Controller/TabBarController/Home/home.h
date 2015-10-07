

#import "ViewController.h"

@interface home : ViewController<UITableViewDataSource,UITableViewDelegate>

-(void)HomeScreen;
-(void)setBackgroundScreen;
-(void)LoadServerData;
-(IBAction)CellBtnClick:(id)sender;
@end
