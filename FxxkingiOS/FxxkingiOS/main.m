//
//  main.m
//  FxxkingiOS
//
//  Created by Rick on 2021/4/13.
//  Copyright © 2021 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

unsigned maximum = 0;


void printMessage() {
    int a[5] = {1, 2, 3, 4, 5};
    int *ptr = (int *)(&a + 1);
    printf("%d, %d", *(a + 1), *(ptr + 1));
}

void getMaximunMallocSize() {
    unsigned blocksize[] = { 1024 * 1024, 1024, 1};
    int i ,count ;
    for (i = 0; i < 3; i++) {
        for (count = 1; ; count ++) {
            void *block = malloc(maximum + blocksize[i] * count);
            if (block) {
                maximum = maximum + blocksize[i] * count;
                free(block);
            } else {
                break;
            }
        }
    }
    printf("maximum malloc size = %u bytes\n", maximum);
}

int main(int argc, char * argv[]) {
    getMaximunMallocSize();
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
