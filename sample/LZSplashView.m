//
//  LZSplashView.m
//  sample
//
//  Created by LYCK on 2020/6/20.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZSplashView.h"
#import "LZScreen.h"

@interface LZSplashView()

@property (nonatomic, strong, readwrite) UIButton *button;

@end


@implementation LZSplashView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)_removeSplashView{
    [self removeFromSuperview];
}

@end
