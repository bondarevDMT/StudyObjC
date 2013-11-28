//
//  BNR1ViewController.m
//  Navigation
//
//  Created by admin on 20.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BNR1ViewController.h"

@interface BNR1ViewController ()

@end

@implementation BNR1ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"First controller"];
    //UIImage *bg = [UIImage imageNamed:@"bg.png"]; //создаю изображение (добавил картинку в Supporting files)
    //UIFont *myFront = [UIFont fontWithName:@"Comic Sans MS.ttf" size:17.0];
    // button.titleLabel.font = [UIFont fontWithName:@"Comic Sans MS" size:40.0]; пытаюсь поменять шриф так
    //[button.titleLabel setFont:myFont]; И так тоже не работает
    //button.titleLabel.font = [UIFont systemFontOfSize:40]; //Получается изменить только размер шрифта
    //[button setBackgroundColor:[UIColor whiteColor]]; //Задаю цвет фона
    [button setFrame:CGRectMake(80, 120, 162, 42)];
    //[button setBackgroundImage:bg forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Push me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
	// Do any additional setup after loading the view.
    
}

-(void)push:()sender//TODO что означает ()sender??
{
    BNVTableViewController *tableController = [BNVTableViewController new]; //метод new - аналог alloc init
    [self.navigationController pushViewController:tableController animated:NO]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
