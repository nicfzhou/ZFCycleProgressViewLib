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
    style.textFontColor   = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1.0];
    style.backgroundColor = [UIColor clearColor];
    style.foregroundColor = [UIColor orangeColor];
    style.foregoundWidth  = 15.0;
    style.isClockwised    = NO;
    style.textPosition    = ZFProgressTextPoistionCenter;
    style.arrowStyle      = ZFProgressArrowStyleAngle;
    style.cycleStartAngle = ZFProgressStartAngleTop;

    return style;
}

@end
