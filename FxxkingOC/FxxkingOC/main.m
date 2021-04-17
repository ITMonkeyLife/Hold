//
//  main.m
//  FxxkingOC
//
//  Created by Rick on 2021/4/10.
//  Copyright © 2021 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MyClass.h"
//#import "MyClass+Category1.h"
#import "MyClass+Category2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyClass *obj = [[MyClass alloc] init];
        [obj printTarget];
//        NSLog(@"%@", obj);
    }
    return 0;
}
