//
//  LZVideoCoverView.h
//  sample
//
//  Created by LYCK on 2020/6/13.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZVideoCoverView : UICollectionViewCell

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
