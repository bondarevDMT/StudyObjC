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
    
    //Фоновая картинка
    //UIImageView *backImage = [UIImageView alloc];
    //UIImageView *backImage = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 320, 480)]; //TODO не получилось установить фоновую картинку не пойму в чем проблема?
    //[backImage initWithImage:[UIImage imageNamed:@"background.png"]];
    
    
    //[self.view addSubview:backImage];
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

    UITableViewCell *c = [table dequeueReusableCellWithIdentifier:@"cell"];
    if (!c) {
        c = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[c textLabel] setText:item];
    return c;
}

-(void)insert:(id)sender
 {
 NSString *t = [field text];
 if ([t isEqualToString:@""]) {
     return;
 }
     [tasks addObject:t];
     [tasks writeToFile:docPath() atomically:YES]; //TODO не получилось записать в файл
     //[t writeToFile:docPath() atomically:YES encoding:1 error:NULL];
     [table reloadData];
     [field setText:@""];
     [field resignFirstResponder];
 }
 

@end
