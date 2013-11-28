//
//  BNVTableViewController.h
//  Navigation
//
//  Created by admin on 20.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *docPath(void);
@interface BNVTableViewController : UIViewController <UITableViewDataSource> 
{
    UITableView *table;
    UIButton *button2;
    UITextField *field;
    NSMutableArray *tasks;
}

@end
