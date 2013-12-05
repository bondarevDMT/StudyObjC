//
//  BDAppDelegate.m
//  ProbaStoryboard
//
//  Created by admin on 05.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BDAppDelegate.h"

@implementation BDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    players = [NSMutableArray arrayWithCapacity:20];
    Player *player = [[Player alloc] init];
    player.name = @"Bill Evans";
    player.game = @"Tic-Tac-Toe";
    player.rating = 4;
    [players addObject:player];
    player = [[Player alloc] init];
    [player setName:@"Oscar Peterson"];
    [player setGame:@"Spin the Bottle"];
    [player setRating:5];
    [players addObject:player];
    player = [[Player alloc] init];
    player.name = @"Dave Brubeck";
    player.game = @"Texas Hold Poker";
    player.rating = 2;
    [players addObject:player];
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;//первый на экран выводится tabBar - кго здесь создаю и вывожу на экран
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0]; // В tabBar на индексе 0 находится UINavigationController - его здесь и создаю
	PlayersViewController *playersViewController = [[navigationController viewControllers] objectAtIndex:0]; // а в UINavigationController под индексом 0 находится PlayersViewController его здесь и создаю
	playersViewController.players = players; //а в этом *playersViewController есть свойство players его я инициализирую players которое заполня выше
    
    return YES;
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
