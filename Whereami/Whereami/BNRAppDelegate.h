//
//  BNRAppDelegate.h
//  Whereami
//
//  Created by admin on 03.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) UIWindow *window;

@end
