//
//  BDViewController.m
//  SingleViewApplication
//
//  Created by admin on 05.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BDViewController.h"

@interface BDViewController ()

@end

@implementation BDViewController

- (void)viewDidLoad
{

    locationManager = [[CLLocationManager alloc] init]; //создаю экземпляр класса для определения местоположения
    [locationManager setDelegate:self];//назначаем делегатом locationmanager делегат приложения
    [locationManager setDistanceFilter:kCLDistanceFilterNone];//меняю свойство для как можно частого обновления местоположения
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//свойство для точного определения местоположения
   // [locationManager startUpdatingLocation];//начать искать свое местоположение //Использовал для первоначальной работы для определения местоположения, когда еще не был создан MKMapView теперь запускаю поиск местоположения на карте
    [worldView setShowsUserLocation:YES];
    [worldView setDelegate:self];
    
}



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error //реализация метода если произошла ошибка определения местоположения.
{
    NSLog(@"Could not find location: %@", error);
}



-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
