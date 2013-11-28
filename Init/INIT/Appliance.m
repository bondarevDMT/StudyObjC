//
//  Appliance.m
//  INIT
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "Appliance.h"

@implementation Appliance

@synthesize productName, voltage;

-(id)init
{
    return [self initWhitProductName:@"Unknown"];
}
-(id) initWhitProductName:(NSString *)p
{
    self = [super init];
    if (self) {
        voltage = 120;
        productName = p;
    }
    return self;
}
@end
