

#import "sharedobject.h"

@implementation sharedobject
@synthesize networkFlag;

+(sharedobject *)sharedmanager{
    
    static sharedobject* singleton=nil;
    if (singleton) {
        return singleton;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton=[[self alloc]init];
        singleton.networkFlag=FALSE;
    });
    
    return singleton;
}


@end
