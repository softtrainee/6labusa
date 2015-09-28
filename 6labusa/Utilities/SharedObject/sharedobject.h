
#import <Foundation/Foundation.h>

@interface sharedobject : NSObject

@property(nonatomic, assign)BOOL networkFlag;
+ (sharedobject *)sharedmanager;

@end
