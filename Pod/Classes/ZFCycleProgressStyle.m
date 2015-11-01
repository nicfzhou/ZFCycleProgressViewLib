//
//  ZFCycleProgressStyle.m
//  ZFCycleProgressView
//
//  Created by 周峰 on 15/10/31.
//  Copyright © 2015年 Feng.z. All rights reserved.
//

#import "ZFCycleProgressStyle.h"

@implementation ZFCycleProgressStyle

+ (instancetype) defaultStyle{
    ZFCycleProgressStyle *style = [ZFCycleProgressStyle new];
    style.textFont        = [UIFont systemFontOfSize:14.0];
    style.textFontColor   = [UIColor colorWithRed:0.98 green:0.45 blue:0.12 alpha:1];
    style.backgroundColor = [UIColor colorWithRed:0.98 green:0.74 blue:0.58 alpha:1];
    style.foregroundColor = [UIColor colorWithRed:0.98 green:0.41 blue:0.02 alpha:1];
    style.foregoundWidth  = 15.0;
    style.isClockwised    = YES;
    style.textPosition    = ZFProgressTextPoistionCenter;
    style.arrowStyle      = ZFProgressArrowStyleRound;
    style.cycleStartAngle = ZFProgressStartAngleTop;

    return style;
}

@end
