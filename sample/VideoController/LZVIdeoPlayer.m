//
//  LZVIdeoPlayer.m
//  sample
//
//  Created by LYCK on 2020/6/14.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZVIdeoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface LZVIdeoPlayer()

@property (nonatomic, strong, readwrite) AVAsset *asset;
@property (nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property (nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property (nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end

@implementation LZVIdeoPlayer

+ (LZVIdeoPlayer *)Player {
    static LZVIdeoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[LZVIdeoPlayer alloc] init];
    });
    return player;
}

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView{
    [self _stopPlay];
    
    // 播放视频
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    // 资源属性
    _asset = [AVAsset assetWithURL:videoURL];
    // 播放状态
    _videoItem = [AVPlayerItem playerItemWithAsset:_asset];
    // 监听状态变化
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    CMTime duration = _videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1,1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度:%@", @(CMTimeGetSeconds(time)));
    }];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];
    

    // 注册视频结束事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    NSLog(@"1");
}

#pragma mark private
- (void)_stopPlay{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_playerLayer removeFromSuperlayer];
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    _videoItem = nil;
    _avPlayer = nil;
}

// 结束时清空数据 垃圾回收
- (void)_handlePlayEnd {
    
    // 循环播放
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
//    [_avPlayer play];
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            
            [_avPlayer play];
        } else {
            NSLog(@"");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSLog(@"缓冲:%@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
