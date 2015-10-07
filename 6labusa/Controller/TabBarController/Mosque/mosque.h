
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface mosque : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    // for map view
    
    
    CLLocationManager *locationManager;
    
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    BOOL firstLaunch;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;



-(void)MosqueDesign;


@end
