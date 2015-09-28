

#import <UIKit/UIKit.h>

@interface TwitterOAuthViewController : UIViewController

- (id)initWithCompletion:(void(^)(BOOL succeeded, id object))completion;

@end
