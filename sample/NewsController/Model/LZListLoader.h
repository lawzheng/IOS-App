//
//  LZListLoader.h
//  sample
//
//  Created by LYCK on 2020/5/31.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LZListItem;
typedef void(^LZListLoaderFinishBlock)(BOOL success, NSArray<LZListItem *> *dataArray);


/**
 列表请求
 */
@interface LZListLoader : NSObject

- (void)loadListDataWithFinishBlock:(LZListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
