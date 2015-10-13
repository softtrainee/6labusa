

#import <UIKit/UIKit.h>

@interface product : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) NSString *ProductId;

-(void)ProductScreen;
-(void)ProductLoadByApi;

@end
