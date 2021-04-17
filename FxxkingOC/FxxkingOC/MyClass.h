//
//  MyClass.h
//  FxxkingOC
//
//  Created by Rick on 2021/4/12.
//  Copyright © 2021 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyClass : NSObject
@property (nonatomic, copy) NSString *target;
- (void)printTarget;
- (void)printName;
@end

NS_ASSUME_NONNULL_END
