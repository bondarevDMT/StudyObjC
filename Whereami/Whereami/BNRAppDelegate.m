//
//  BNRAppDelegate.m
//  Whereami
//
//  Created by admin on 03.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BNRAppDelegate.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    locationManager = [[CLLocationManager alloc] init];//создаю экземпляр класса для определения местоположения
    //[self doSomethingWeird];
    [locationManager setDelegate:self];//назначаем делегатом locationmanager делегат приложения
    [locationManager setDistanceFilter:kCLDistanceFilterNone];//меняю свойство для как можно частого обновления местоположения
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//свойство для точного определения местоположения
   // [locationManager startUpdatingLocation];//начать искать свое местоположение //Использовал для первоначальной работы для определения местоположения, когда еще не был создан MKMapView теперь запускаю поиск местоположения на карте
    [worldView setShowsUserLocation:YES];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)doSomethingWeird
{
    NSLog(@"Line 1");
    NSLog(@"Line 2");
    NSLog(@"Line 3");
}


-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//метод для делегата CLLocationManager (при обновлении местоположения)
{
    NSLog(@"%@",newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//реализация метода если произошла ошибка определения местоположения.
{
    NSLog(@"Could not find location: %@", error);
}


-(void)dealloc
{
    
}


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
