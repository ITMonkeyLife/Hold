//
//  ViewController.m
//  FxxkingiOS
//
//  Created by Rick on 2021/4/13.
//  Copyright © 2021 Rick. All rights reserved.
//

#import "ViewController.h"
#import "JPUtils.h"

@interface ViewController ()
@property(nonatomic, assign) int count;
@end

@implementation ViewController

- (void)testgcd1 {
    __block int a = 0;
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);

    while (a < 5) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            a++;
            dispatch_semaphore_signal(sem);
            
        });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    }
    NSLog(@"%d", a);
}


- (void)testgcd2 {
    
    
//    dispatch_queue_t queue = dispatch_queue_create("Felix", DISPATCH_QUEUE_CONCURRENT);
//    NSMutableArray *marr = @[].mutableCopy;
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            [marr addObject:@(i)];
//        });
//    }
//    NSLog(@"%lu", marr.count);
    
    // 1、使用串行队列 DISPATCH_QUEUE_SERIAL
//    dispatch_queue_t queue = dispatch_queue_create("Felix", DISPATCH_QUEUE_SERIAL);
//    NSMutableArray *marr = @[].mutableCopy;
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            [marr addObject:@(i)];
//        });
//    }
//    NSLog(@"%lu", marr.count);
    
    //
//    dispatch_queue_t queue = dispatch_queue_create("Felix", DISPATCH_QUEUE_CONCURRENT);
//    NSMutableArray *marr = @[].mutableCopy;
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            @synchronized (self) {
//                [marr addObject:@(i)];
//            }
//        });
//    }
//    NSLog(@"%lu", marr.count);
    
    dispatch_queue_t queue = dispatch_queue_create("Felix", DISPATCH_QUEUE_CONCURRENT);
    NSMutableArray *marr = @[].mutableCopy;
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            [marr addObject:@(i)];
        });
        dispatch_barrier_async(queue, ^{});
    }
    dispatch_async(queue, ^{
        NSLog(@"%lu", marr.count);
    });
}

- (void)testThread {

    NSThread *thread1 = [[NSThread alloc] initWithBlock:^{
        
        for (int i = 0; i < 5; i++) {
            self.count++;
            NSLog(@"thread 1  current index %d \tcount = %d", i, self.count);
        }
    }];
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithBlock:^{
        for (int i = 0; i < 5; i++) {
            
            self.count++;
            NSLog(@"thread 2  current index %d \tcount = %d", i, self.count);
        }
    }];
    [thread2 start];
    
    NSThread *thread3 = [[NSThread alloc] initWithBlock:^{
        for (int i = 0; i < 5; i++) {
            
            self.count++;
            NSLog(@"thread 3  current index %d \tcount = %d", i, self.count);
        }
    }];
    [thread3 start];
    
    
    NSThread *thread4 = [[NSThread alloc] initWithBlock:^{
        for (int i = 0; i < 5; i++) {
            
            self.count++;
            NSLog(@"thread 4  current index %d \tcount = %d", i, self.count);
        }
    }];
    [thread4 start];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"count = %d", self.count);
    });
    
}

- (void)testAutoreleasePool {
    NSArray *urls = @[@"test", @"vary", @"test1"];
    for (NSString *url in urls) {
     
        @autoreleasepool {
            NSString *fileContents = url;
            /* Process the string, creating and autoreleasing more objects. */
            NSLog(url);
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
//    [dictionary setValue:nil forKey:@"key"];
//    [dictionary setObject:nil forKey:@"copyTestKey"];// NSInvalidArgumentException
    [self testThread];
    // Do any additional setup after loading the view.
    // 队列先进先出同步对于任务是立刻执行的，那么当把任务放进主队列时，它就会立马执行，只有执行完这个任务，viewDidLoad才会继续向下执行。而viewDidLoad和任务都是在主队列上的，由于队列的先进先出原则，任务又需等待viewDidLoad执行完毕后才能继续执行，viewDidLoad和这个任务就形成了相互循环等待，就造成了死锁。
    // 想避免这种死锁，可以将同步改成异步dispatch_async或者将dispatch_get_main_queue换成其他串行或并行队列，都可以解决
//    dispatch_sync(dispatch_get_main_queue(), ^{
//      NSLog(@"deallock");
//    });
    //外面的函数无论是同步还是异步都会造成死锁。这是因为里面的任务和外面的任务都在同一个serialQueue队列内，又是同步，这就和上边主队列同步的例子一样造成了死锁。
//    dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(serialQueue, ^{
//      dispatch_sync(serialQueue, ^{
//        NSLog(@"deadlock");
//      });
//    });
    
//    NSLog(@"%@", [JPUtils getTopVC]);
}


@end
