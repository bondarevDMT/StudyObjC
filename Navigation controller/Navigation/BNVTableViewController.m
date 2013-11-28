//
//  BNVTableViewController.m
//  Navigation
//
//  Created by admin on 20.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BNVTableViewController.h"
NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"data.d"];
}
@interface BNVTableViewController ()

@end

@implementation BNVTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
        if (plist) {
            tasks = [plist mutableCopy];
        } else tasks = [[NSMutableArray alloc]init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Second Controller"];
    //Таблица
	table = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, 320, 360) style:UITableViewStyleGrouped];
    [table setDataSource:self];
    
    //Поле для ввода
    field = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 200, 31)];
    [field setBorderStyle:UITextBorderStyleRoundedRect];
    [field setPlaceholder:@"Type a tsak, tap Insert"];

    //Кнопка
    button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(228, 80, 72, 31)];
    [button2 setTitle:@"Insert" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(insert:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:table];
    [self.view addSubview:field];
    [self.view addSubview:button2];
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *c = [table dequeueReusableCellWithIdentifier:@"cell"]; //TODO @optional отдельно хотел спросить на счет @"cell" и двух обязательныых методах <ITableViewDataSource> (как их реализовывать). Если у самого не получится разобраться к следующей недели 
    if (!c) {
        c = [[UITableViewCell alloc]initWithStyle:UITableViewCellSelectionStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[c textLabel] setText:item];
    return c;
}

-(void)insert:(id)sender//TODO для чего слово sender? Как-то связано с селектором?
 {
 NSString *t = [field text];
 if ([t isEqualToString:@""]) {
     return;
 }
     [tasks addObject:t];
     [table reloadData];
     [field setText:@""];
     [field resignFirstResponder];
 }
 

@end
