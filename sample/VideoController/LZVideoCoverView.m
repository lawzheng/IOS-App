//
//  LZVideoCoverView.m
//  sample
//
//  Created by LYCK on 2020/6/13.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZVideoCoverView.h"
#import "LZVIdeoPlayer.h"
#import "LZVideoToolBar.h"

@interface LZVideoCoverView()

@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, copy, readwrite) LZVideoToolBar *toolBar;

@end

@implementation LZVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height - LZVideoToolBarHeight)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2,(frame.size.height - LZVideoToolBarHeight -50)/2,50,50)];
            _playButton;
        })];
        
        [self addSubview:({
            _toolBar = [[LZVideoToolBar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, LZVideoToolBarHeight)];
            _toolBar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}

// 页面销毁时移除事件
- (void)dealloc{
    
}

#pragma public
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/skin.png"];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

- (void)_tapToPlay{

    // 播放视频
    [[LZVIdeoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}


@end
