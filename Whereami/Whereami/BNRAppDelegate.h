//
//  BNRAppDelegate.h
//  Whereami
//
//  Created by admin on 03.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate>
{
   CLLocationManager *locationManager; 
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleFeild;
}
@property (strong, nonatomic) UIWindow *window;

-(void)doSomethingWeird;//метод для работы с отладчиком (проверял вход в метод)

@end
