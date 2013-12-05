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

//-(void)doSomethingWeird;//метод для работы с отладчиком (проверял вход в метод)

@end
//TODO Проект не работает (проблема в xib)
//Я создавал как обычно пустой проект и у меня не было MainWindow.xib пришлось создавать дополнительный xib в file's Owner указывать UIApplication потом добавлять объект указывать  что он делегатом приложения(BNRAppDelegate). Этот путь единственный?? и вообще я правильно сделал?
//Далее Я создал в xib все view далее связал их с объектом где они объявлены (делегат приложения) и еще установил от них связь на делегирование (что делегат приложения является их делегатом) это означает что я всего лишь в .m делегата приложения якобы написал строчки   для каждого из них [(какой-то vew) setDelegate:self] и больше ничего??
//Описал MKMapView настроил -(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation По идее на данном этапе при запуске приложения у меня должна отображаться на дисплее все мои добавленные view + на карте должно отображаться мое местоположение в границах 250, 250 метров. Но в итоге ничего нет.
//Причина в том что надо было сразу создавать простое приложение с xib. А если я как здесь создал простое приложение cacoa touch то как мне начать работать с xib??
//TODO Когда изучал главу 4 для определения местоположения я исполььзовал CLLocationManager, а в 5 главе создал MKMapView(как я понимаю могу удалить CLLocationManager). А когда я пишу [worldView setShowsUserLocation:YES] то заставляю mapview определить местоположение пользователя, но ведь view ничего не может кроме отображения. Получается что каждый раз когда я испоьлзую MapView мне всегда надо будет создавать CLLocationManager чтобы он работал на низком уровне и определял местоположение?? И еще в программе я нигде MapView не указываю о существовании CLLocationManager как он получает от него данные?
//TODO -(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation это метод для делегата MKMapView Но от кого получает MKMapView это сообщение?? от центра оповещений? от куда он берет (MKUserLocation *)?? Это сообщение отправляет CLLocationManager??
