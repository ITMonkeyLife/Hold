//
//  JPUtils.h
//  FxxkingiOS
//
//  Created by Rick on 2021/4/13.
//  Copyright © 2021 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JPUtils : NSObject
+ (UIWindow *)getCurrentWindow;
+ (UIViewController *)getTopVC;
@end

NS_ASSUME_NONNULL_END
