//
//  MyClass.m
//  FxxkingOC
//
//  Created by Rick on 2021/4/12.
//  Copyright © 2021 Rick. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass
- (void)printTarget
{
    
    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000 ; i++) {
        dispatch_async(queue, ^{
            self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
            NSLog(@"%@",self.target);
        });
    }
}

@end
