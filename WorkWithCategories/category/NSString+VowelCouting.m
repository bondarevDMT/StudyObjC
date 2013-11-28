//
//  NSString+VowelCouting.m
//  category
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "NSString+VowelCouting.h"

@implementation NSString (VowelCouting)
-(int)vowelCount
{
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSInteger count = [self length];
    int sum = 0;
    for (int i = 0; i < count; i ++) {
        unichar c = [self characterAtIndex: i];
        if ([charSet characterIsMember:c]) {
            sum ++;
        }
    }return sum;
}
@end
