//
//  Appliance.h
//  INIT
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appliance : NSObject
{
    NSString *productName;
    int voltage;
}
@property (copy) NSString *productName;
@property int voltage;
//основной инициализатор
-(id)initWhitProductName:(NSString *)p;


@end
