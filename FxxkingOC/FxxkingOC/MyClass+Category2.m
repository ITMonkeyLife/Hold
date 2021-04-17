//
//  MyClass+Category2.m
//  FxxkingOC
//
//  Created by Rick on 2021/4/12.
//  Copyright © 2021 Rick. All rights reserved.
//

#import "MyClass+Category2.h"

#import <AppKit/AppKit.h>


@implementation MyClass (Category2)
+ (void)load
{
    NSLog(@"%@",@"load in Category2");
}

- (void)printName
{
    NSLog(@"%@",@"My   Category2");
}
@end
