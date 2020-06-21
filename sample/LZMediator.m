//
//  LZMediator.m
//  sample
//
//  Created by LYCK on 2020/6/20.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZMediator.h"

@implementation LZMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl{
    
    Class detailCls = NSClassFromString(@"LZDetailViewController");
    UIViewController *viewController = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return viewController;
}

+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(LZMediatorProcessBlock)processBlock{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    LZMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block){
        block(params);
    }
}

@end
