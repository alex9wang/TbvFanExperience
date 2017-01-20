//
//  MeetUpVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "MeetUpVC.h"
#import "MapUtility.h"

@interface MeetUpVC ()
{
    
    CLLocationCoordinate2D  myLocation;
    CLLocationCoordinate2D  friendLocation;
    CLLocationCoordinate2D  destLocation;
}

@end

@implementation MeetUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSliderMenuButton];
    
    
    [self initGoogleMap];
    [self initLocationManager];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self showMyLocation];
    [self showPartnerLocation:CLLocationCoordinate2DMake(51.0174, -114.0545)];
    [self showPartnerLocation:CLLocationCoordinate2DMake(51.0177, -113.0545)];
    [self showPartnerLocation:CLLocationCoordinate2DMake(51.0115, -114.0945)];
    [self showPartnerLocation:CLLocationCoordinate2DMake(50.9315, -112.6525)];
}

- (void)initGoogleMap
{
    myLocation      = CLLocationCoordinate2DMake(0, 0);
    friendLocation  = CLLocationCoordinate2DMake(0, 0);
    destLocation    = CLLocationCoordinate2DMake(0, 0);
    
    _mapView.delegate = self;
    _mapView.myLocationEnabled = YES;
}

- (void)initLocationManager
{
    if (![CLLocationManager locationServicesEnabled]) {
        [UTILITY showMessage:self
                     message:@"Please Enable location access from Setting -> TBV FAN EXPERIENCE -> Privacy -> Location services"
                    callback:^void(){
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                    }];
        return;
    }
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    [_locationManager startUpdatingLocation];
    
}

- (void)showMyLocation {
    
//    [_locationManager requestWhenInUseAuthorization];
//    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
//        [_locationManager requestWhenInUseAuthorization];
//    }
    
//    CLLocation *location = _locationManager.location;
//    CLLocationCoordinate2D coordinate = location.coordinate;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(51.012731, -114.055418);
    
    [self centerMapOnLocation:coordinate];
    
    [self showIconMarker:coordinate imgName:@"my_marker.png"];
}

- (void)showPartnerLocation:(CLLocationCoordinate2D)coordinate {
    
    [self showIconMarker:coordinate imgName:@"partner_marker.png"];
}

- (void)refreshMapView {
    [_mapView clear];
    
    if (friendLocation.latitude != 0.0 && friendLocation.longitude != 0.0) {
        GMSMarker *partnerMarker = [GMSMarker markerWithPosition:friendLocation];
        partnerMarker.title = @"friend";
        partnerMarker.snippet = @"";
        partnerMarker.map = self.mapView;
    }
    
    if (destLocation.latitude != 0 && destLocation.longitude != 0) {
        
        GMSMarker *destMarker = [GMSMarker markerWithPosition:destLocation];
        destMarker.title = @"Target location";
        destMarker.snippet = @"";
        destMarker.map = self.mapView;
        destMarker.icon = [UIImage imageNamed:@"map_dest_mark.png"];
        
        [MAP_UTIL getPath:myLocation withEndPlace:destLocation success:^(NSData *data) {
            [self drawPath:data withColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5f]];
        } failure:^(NSError *error) {
            NSLog(@"There is an Error: %@", error);
        }];
    }
}

- (void)drawPath:(NSData *)data withColor:(UIColor *)color {
    if (data == nil)
        return;
    
    NSMutableDictionary *jsonDictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", jsonDictionary);
    GMSPath *path =[GMSPath pathFromEncodedPath:jsonDictionary[@"routes"][0][@"overview_polyline"][@"points"]];
    GMSPolyline *singleLine = [GMSPolyline polylineWithPath:path];
    singleLine.strokeWidth = 5;
    singleLine.strokeColor = color;
    singleLine.map = self.mapView;
}


- (void) centerMapOnLocation:(CLLocationCoordinate2D) location {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.latitude longitude:location.longitude zoom:10];
    _mapView.camera = camera;
    _mapView.myLocationEnabled = YES;
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (myLocation.latitude != 0 && myLocation.longitude != 0) {
        myLocation = manager.location.coordinate;
        [self centerMapOnLocation:manager.location.coordinate];
    } else {
        CLLocation *newLocation = manager.location;
        CLLocation *oldLocation = [[CLLocation alloc] initWithLatitude:myLocation.latitude longitude:myLocation.longitude];
        
        CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
        if (distance >= 100.0f) {
            myLocation = newLocation.coordinate;
            [self refreshMapView];
        }
        
        NSLog(@"OldLocation %f %f", myLocation.latitude, myLocation.longitude);
        NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
        NSLog(@"distance: %f", distance);
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] != 0) {
        DLog(@"didFailWithError: %@", error);
    }
}


#pragma mark -
#pragma mark - Google Map Delegate

- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position {
//    [self centerMapOnLocation:position.target];
//    NSLog(@"%f, %f", position.target.latitude, position.target.longitude);
}

- (void) mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)position {

}

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    //    [self.paymentView setHidden:YES];
}


- (void)showIconMarker:(CLLocationCoordinate2D)place imgName:(NSString*)imgName
{
//    UIImageView *gasImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2, 32, 32)];
//    gasImage.image  = [UIImage imageNamed:@"login_logo.png"];
    
    //    [gasImage getimag]
    //
    //var logo = UIImageView(frame: CGRectMake(30-23, 2, 16, 16))
    //logo.image = UIImage(named: "Logo")
    //gasView.addSubview(logo)
    ////Add Callout Background Image
    //gasView.backgroundColor = UIColor(patternImage: UIImage(named: "Callout")!)
    
    
    GMSMarker *markerOwner = [[GMSMarker alloc] init];
    markerOwner.position = place;
    markerOwner.icon = [UIImage imageNamed:imgName];
    markerOwner.map = _mapView;
}


@end
