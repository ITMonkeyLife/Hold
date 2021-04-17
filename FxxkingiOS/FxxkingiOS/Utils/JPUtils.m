//
//  JPUtils.m
//  FxxkingiOS
//
//  Created by Rick on 2021/4/13.
//  Copyright © 2021 Rick. All rights reserved.
//

#import "JPUtils.h"

@implementation JPUtils
+(UIWindow*)getCurrentWindow{
    
    if ([[[UIApplication sharedApplication] delegate]window]) {
        return [[[UIApplication sharedApplication] delegate]window];
    } else {
        if (@available(iOS 13.0,*)) {
          UIWindow *foundWindow = nil;
          NSArray  *windows = [[UIApplication sharedApplication]windows];
           for (UIWindow  *window in windows) {
             if (window.isKeyWindow) {
                foundWindow = window;
                break;
             }
            }
            return foundWindow;
        } else {
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Wdeprecated-declarations"
            return  [UIApplication sharedApplication].keyWindow;
            #pragma clang diagnostic pop

        }
    }
}

+ (UIViewController *)getTopVC {
    UIViewController* vc = [JPUtils getCurrentWindow].rootViewController;
    
    while (1) {
        //顶层控制器 可能是 UITabBarController的root控制器
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        
        //顶层控制器 可能是 push出来的 或者是root控制器
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        
        //顶层控制器 可能是 modal出来的
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    
    return vc;
}
@end
