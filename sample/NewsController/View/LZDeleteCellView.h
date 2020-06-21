//
//  LZDeleteCellView.h
//  sample
//
//  Created by LYCK on 2020/5/31.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDeleteCellView : UIView

- (void) showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
