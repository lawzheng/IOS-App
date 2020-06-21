//
//  LZTableViewCell.h
//  sample
//
//  Created by LYCK on 2020/5/30.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZListItem;

@protocol LZTabViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface LZTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<LZTabViewCellDelegate> delegate;

- (void) layoutTableViewCellWithItem:(LZListItem *)item;

@end

NS_ASSUME_NONNULL_END
