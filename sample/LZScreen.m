//
//  LZScreen.m
//  sample
//
//  Created by LYCK on 2020/6/14.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZScreen.h"

@implementation LZScreen


// iphone xs max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414, 896);
}
// iphone xr
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414, 896);
}
// iphonex
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(375, 812);
}

@end
