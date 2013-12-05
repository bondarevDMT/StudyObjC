//
//  BDAppDelegate.h
//  ProbaStoryboard
//
//  Created by admin on 05.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//TODO почему нельзя без UINavigationController Связать TabViewController с UITableView?

#import <UIKit/UIKit.h>
#import "Player.h"
#import "PlayersViewController.h"
@interface BDAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *players;
}
@property (strong, nonatomic) UIWindow *window;

@end
