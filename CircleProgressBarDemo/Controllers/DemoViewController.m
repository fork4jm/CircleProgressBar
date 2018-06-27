//
//  ViewController.m
//  CircleProgressBar
//
//  Created by Andrew Cherkashin on 3/15/15.
//  Copyright (c) 2015 Eclair. All rights reserved.
//

#import "DemoViewController.h"
#import "CountdownProgressView.h"

@interface DemoViewController (Private)

- (CustomizationState)nextCustomizationState:(CustomizationState)state;
- (NSString*)buttonTextForState:(CustomizationState)state;
- (void)customizeAccordingToState:(CustomizationState)state;

@end

@implementation DemoViewController {
    CustomizationState _state;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)increaseProgress:(id)sender {
    [_circleProgressBar.foreCircleProgressBar setProgress:(_circleProgressBar.foreCircleProgressBar.progress + 10.0/60.0) animated:YES];
    [_circleProgressBar.shadowCircleProgressBar setProgress:(_circleProgressBar.shadowCircleProgressBar.progress + 10.0/60.0) animated:YES];
}

- (IBAction)decreaseProgress:(id)sender {
    [_circleProgressBar.foreCircleProgressBar setProgress:(_circleProgressBar.foreCircleProgressBar.progress - 10.0/60.0) animated:YES];
    [_circleProgressBar.shadowCircleProgressBar setProgress:(_circleProgressBar.shadowCircleProgressBar.progress - 10.0/60.0) animated:YES];
}

- (IBAction)customizeNext:(id)sender {
    _state = [self nextCustomizationState:_state];
    
    [self customizeAccordingToState:_state];
    
    [_customizeButton setTitle:[self buttonTextForState:_state] forState:UIControlStateNormal];
}

@end

@implementation DemoViewController (Private)

- (CustomizationState)nextCustomizationState:(CustomizationState)state {
    switch (state) {
        case CustomizationStateCustomAttributed: return 0;
        default: return (state + 1);
    }
}

- (NSString*)buttonTextForState:(CustomizationState)state {
    switch ([self nextCustomizationState:state]) {
        case CustomizationStateDefault: return @"BACK TO DEFAULTS";
        case CustomizationStateCustom: return @"CUSTOMIZE";
        case CustomizationStateCustomAttributed: return @"ADD ATTRIBUTED TEXT";
    }
}

- (void)customizeAccordingToState:(CustomizationState)state {
    BOOL customized = state != CustomizationStateDefault;
}

@end
