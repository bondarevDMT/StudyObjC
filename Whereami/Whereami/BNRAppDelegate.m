//
//  BNRAppDelegate.m
//  Whereami
//
//  Created by admin on 03.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "MapPoint.h"
@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    locationManager = [[CLLocationManager alloc] init];//создаю экземпляр класса для определения местоположения
    //[self doSomethingWeird];// использовал при изучении работы с отладчиком (вход в /метод)
   [locationManager setDelegate:self];//назначаем делегатом locationmanager делегат приложения
    [locationManager setDistanceFilter:kCLDistanceFilterNone];//меняю свойство для как можно частого обновления местоположения
   [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//свойство для точного определения местоположения
  // [locationManager startUpdatingLocation];//начать искать свое местоположение //Использовал для первоначальной работы для определения местоположения, когда еще не был создан MKMapView теперь запускаю поиск местоположения на карте
    worldView.showsUserLocation = YES;
    //[worldView setShowsUserLocation:YES];
    return YES;
}
/*-(void)doSomethingWeird
{
    NSLog(@"Line 1");
    NSLog(@"Line 2");
    NSLog(@"Line 3");
}*/

#pragma mark metod for delegate MapView

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation //метод для делегата MapView
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

#pragma mark metod for delegate CLLocation
//метод что делать при обновлении местоположения
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@",newLocation);
    NSTimeInterval t = [[newLocation timestamp]timeIntervalSinceNow];
    if (t< -180) {
        return;
    }
    [self foundLocation:newLocation];
}
//реализация метода если произошла ошибка определения местоположения.
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

#pragma mark metod for delegate UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark metod for UITextField

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleFeild  setHidden:YES];
}
-(void)foundLocation:(CLLocation *)loc1
{
    CLLocationCoordinate2D coord = [loc1 coordinate];
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:coord title:[locationTitleFeild text]];
    [worldView addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    [locationTitleFeild setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleFeild setHidden:NO];
    [locationManager stopUpdatingLocation];
}




#pragma mark metod APPDelegate

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
