//
//  MyClass+Category1.h
//  FxxkingOC
//
//  Created by Rick on 2021/4/12.
//  Copyright © 2021 Rick. All rights reserved.
//

#import <AppKit/AppKit.h>


#import "MyClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyClass (Category1)
@property(nonatomic, copy) NSString *name;

- (void)printName;
@end

NS_ASSUME_NONNULL_END
