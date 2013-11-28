//
//  main.m
//  category
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCouting.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
     NSString *string = @"Hellow";
        NSLog(@"%@ has %d vowels", string, [string vowelCount]);
    }
    return 0;
}

