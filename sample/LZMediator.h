//
//  LZMediator.h
//  sample
//
//  Created by LYCK on 2020/6/20.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZMediator : NSObject

// target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

// url scheme
typedef void(^LZMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(LZMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
