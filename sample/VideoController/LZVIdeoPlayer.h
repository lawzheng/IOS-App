//
//  LZVIdeoPlayer.h
//  sample
//
//  Created by LYCK on 2020/6/14.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZVIdeoPlayer : NSObject

+ (LZVIdeoPlayer *)Player;

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView  *)attachView;

@end

NS_ASSUME_NONNULL_END
