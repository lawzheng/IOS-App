//
//  LZDeleteCellView.m
//  sample
//
//  Created by LYCK on 2020/5/31.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZDeleteCellView.h"

@interface LZDeleteCellView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;
@end

@implementation LZDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            _deleteButton.backgroundColor = [UIColor blueColor];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton;
        })];
    }
    return self;
}


- (void) showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    // 显示的时候将回调赋给全局属性
    _deleteBlock = [clickBlock copy];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    // 简单动画
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    }];
    
    // 稍复杂
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished){
        NSLog(@"");
    }];
}


- (void) dismissDeleteView{
    [self removeFromSuperview];
}


- (void) _clickButton{
    // 存在回调就调回调
    if (_deleteBlock) {
        _deleteBlock();
    }

    [self removeFromSuperview];
}

@end
