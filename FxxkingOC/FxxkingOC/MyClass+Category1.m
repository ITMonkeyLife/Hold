//
//  MyClass+Category1.m
//  FxxkingOC
//
//  Created by Rick on 2021/4/12.
//  Copyright © 2021 Rick. All rights reserved.
//

#import "MyClass+Category1.h"
#import <objc/runtime.h>
#import <AppKit/AppKit.h>


@implementation MyClass (Category1)
+ (void)load
{
    NSLog(@"%@",@"load in Category1");
}

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self,
                             "name",
                             name,
                             OBJC_ASSOCIATION_COPY);
}

- (NSString*)name
{
    NSString *nameObject = objc_getAssociatedObject(self, "name");
    return nameObject;
}

- (void)printName
{
    NSLog(@"%@",@"My   Category1");
}
@end
