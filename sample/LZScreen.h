//
//  LZScreen.h
//  sample
//
//  Created by LYCK on 2020/6/14.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_MAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [LZScreen sizeFor58Inch].width && SCREEN_HEIGHT == [LZScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [LZScreen sizeFor61Inch].width && SCREEN_HEIGHT == [LZScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_MAX (SCREEN_WIDTH == [LZScreen sizeFor65Inch].width && SCREEN_HEIGHT == [LZScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)

#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)

static inline NSInteger UIAdapter (float x){
    CGFloat scale = 414 / SCREEN_WIDTH;
    return (NSInteger)x / scale;
}

static inline CGRect UIRectAdapter(x,y,width,height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface LZScreen : NSObject

// iphone xs max
+ (CGSize)sizeFor65Inch;
// iphone xr
+ (CGSize)sizeFor61Inch;
// iphonex
+ (CGSize)sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
