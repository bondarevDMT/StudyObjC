//
//  OwnedAppliance.m
//  INIT
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance

-(id) initWhitProductName:(NSString *)p
{
    return [self initWhitProductName:p firstOwnerName:nil];
}
-(id) initWhitProductName:(NSString *)p firstOwnerName:(NSString *)n
{
    self = [super initWhitProductName:p];
    if (self)
    {
        ownerNames = [[NSMutableSet alloc] init];
        if (n) {
            [ownerNames addObject:n];
        }
    }
    return self;
}
-(void) addOwnerNamesObject:(NSString *)n
{
    [ownerNames addObject:n];
}
-(void)removeOwnerNamesObject:(NSString *)n
{
    [ownerNames removeObject:n];
}
@end
