//
//  main.m
//  INIT
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

int main()
{
    Appliance *p = [[Appliance alloc] init];
    NSLog(@"znschenie ravno = %d, product name = %@", p.voltage, p.productName);
    return 0;
}

