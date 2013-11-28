//
//  BNRAppDelegate.h
//  Navigation
//
//  Created by admin on 20.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRChangeColorOfBackground.h" //подключаю протокол BNRChangeColorOfBackground

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate, BNRChangeColorOfBackground> //указываю поддержку протокола BNRChangeColorOfBackground

@property (strong, nonatomic) UIWindow *window;

@end
