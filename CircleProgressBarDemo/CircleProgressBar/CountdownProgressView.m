//
//  CountdownProgressView.m
//  CircleProgressBarDemo
//
//  Created by Ge on 2018/6/26.
//  Copyright © 2018 Eclair. All rights reserved.
//

#import "CountdownProgressView.h"

@interface CountdownProgressView()

@end

@implementation CountdownProgressView

- (CircleProgressBar *)backCircleProgressBar {
    if (!_backCircleProgressBar) {
        _backCircleProgressBar = [[CircleProgressBar alloc] initWithFrame:self.bounds];
        _backCircleProgressBar.backgroundColor = [UIColor clearColor];
        [_backCircleProgressBar setProgressBarWidth:7.0];
        [_backCircleProgressBar setProgressBarProgressColor:[UIColor whiteColor]];
        [_backCircleProgressBar setProgressBarTrackColor:[UIColor colorWithRed:203.0/255.0 green:167.0/255.0 blue:75.0/255.0 alpha:1]];
        CALayer *maskLayer = [CALayer layer];
        UIImage *mask = [UIImage imageNamed:@"countdown_mask"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.frame = CGRectMake(0.0, 0.0,30,30);
        _backCircleProgressBar.layer.mask = maskLayer;
    }
    return _backCircleProgressBar;
}

- (CircleProgressBar *)shadowCircleProgressBar {
    if (!_shadowCircleProgressBar) {
        CGRect frame = self.bounds;
        frame.origin.y += 1;
        frame.origin.x += 1;
        _shadowCircleProgressBar = [[CircleProgressBar alloc] initWithFrame:frame];
        _shadowCircleProgressBar.backgroundColor = [UIColor clearColor];
        [_shadowCircleProgressBar setProgressBarWidth:7.0];
        [_shadowCircleProgressBar setProgressBarProgressColor:[UIColor blueColor]];
        [_shadowCircleProgressBar setProgressBarTrackColor:[UIColor colorWithRed:255.0/255.0 green:221.0/255.0 blue:131.0/255.0 alpha:1]];

        CALayer *maskLayer = [CALayer layer];
        UIImage *mask = [UIImage imageNamed:@"countdown_mask"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.frame = CGRectMake(0.0, 0.0,30,30);
        _shadowCircleProgressBar.layer.mask = maskLayer;

    }
    return _shadowCircleProgressBar;
}

- (CircleProgressBar *)foreCircleProgressBar {
    if (!_foreCircleProgressBar) {
        _foreCircleProgressBar = [[CircleProgressBar alloc] initWithFrame:self.bounds];
        _foreCircleProgressBar.backgroundColor = [UIColor clearColor];
        [_foreCircleProgressBar setProgressBarWidth:7.0];
        [_foreCircleProgressBar setProgressBarProgressColor:[UIColor redColor]];
        [_foreCircleProgressBar setProgressBarTrackColor:[UIColor colorWithRed:86.0/255.0 green:136.0/255.0 blue:12.0/255.0 alpha:1]];

        CALayer *maskLayer = [CALayer layer];
        UIImage *mask = [UIImage imageNamed:@"countdown_mask"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.frame = CGRectMake(0.0, 0.0,30,30);
        _foreCircleProgressBar.layer.mask = maskLayer;
    }
    return _foreCircleProgressBar;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.backCircleProgressBar];
    [self addSubview:self.shadowCircleProgressBar];
    [self addSubview:self.foreCircleProgressBar];
}

@end
