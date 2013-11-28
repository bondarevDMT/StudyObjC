//
//  main.m
//  VowelMovement
//
//  Created by admin on 28.11.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^myBloc)(id, NSInteger, BOOL *); //Создаю тип myBloc для блоков
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *oldString = [NSArray arrayWithObjects:@"Sauerkraut", @"Raygun", @"Mississippi", nil];
        NSLog(@"old string %@", oldString);
        NSMutableArray *newStrings = [NSMutableArray array];
        NSArray *vowels = [NSArray arrayWithObjects:@"a",@"e", @"i", @"o", @"u", nil];
        //void (^devowelizer)(id, NSInteger, BOOL *);//Объявление блочной переменной
        //void - тип возвращаемого значения ^ - признак блока devowelizer - имя блочной переменной во вторых скобказ передаваемые аргументы
        
        //используя тип myBlock из typedef создаю блок devowelizer
        myBloc devowelizer = ^(id string, NSInteger i, BOOL *stop){
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            [newStrings addObject:newString];
        };
        [oldString enumerateObjectsUsingBlock:devowelizer]; //TODO прочитал ошибку, понял что проблема с несоответствием типов, но как исправить так до меня и не дошло.
        NSLog(@"new strings: %@",newStrings);
        
    }
    
    return 0;
}

