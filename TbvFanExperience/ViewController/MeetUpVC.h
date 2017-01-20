//
//  MeetUpVC.h
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@class GMSMapView;

@interface MeetUpVC : BaseVC <CLLocationManagerDelegate, GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet GMSMapView     *mapView;

@property (strong, nonatomic) CLLocationManager     *locationManager;

@end



