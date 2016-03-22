//
//  WaveformView.m
//  DroneOn
//
//  Created by Curt Miller on 1/30/16.
//  Copyright © 2016 Curt Miller. All rights reserved.
//

#import "WaveformView.h"

@implementation WaveformView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [[UIColor blackColor] setStroke];

    UIBezierPath *referenceLine = [UIBezierPath bezierPath];
    [referenceLine moveToPoint:CGPointMake(0, 49)];
    [referenceLine addLineToPoint:CGPointMake(200, 49)];
    referenceLine.lineWidth = 2;
    [referenceLine stroke];
    
}


@end
