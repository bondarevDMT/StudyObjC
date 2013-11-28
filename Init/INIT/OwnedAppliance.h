//
//  OwnedAppliance.h
//  INIT
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "Appliance.h"

@interface OwnedAppliance : Appliance
{
    NSMutableSet *ownerNames;
}
//основной инициализатор
-(id)initWhitProductName:(NSString *)p firstOwnerName:(NSString *)n;
-(void)addOwnerNamesObject:(NSString *)n;
-(void)removeOwnerNamesObject:(NSString *)n;
@end
