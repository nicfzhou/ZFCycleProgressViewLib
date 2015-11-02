//
//  ZFCycleProgressView.m
//  ZFCycleProgressView
//
//  Created by 周峰 on 15/10/31.
//  Copyright © 2015年 Feng.z. All rights reserved.
//

#import "ZFCycleProgressView.h"
#import <QuartzCore/QuartzCore.h>


@interface ZFCycleProgressView()
@property (strong,nonatomic) NSBlockOperation *operation;
@end

@implementation ZFCycleProgressView

- (instancetype) initWithFrame:(CGRect)frame style:(ZFCycleProgressStyle*) style{
    if (self = [super initWithFrame:frame]) {
        self.style = style;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) setProgress:(int)progress {
    if (_progress == 100 && progress>100) {
        return;
    }
    
    [_operation cancel];
    _operation = nil;
    __weak typeof(self) weakSelf = self;
    _operation = [NSBlockOperation blockOperationWithBlock:^{
        int start = _progress;
        int end = progress>100?100:(progress<0?0:progress);
        BOOL isAdding = end>start;
        int step = isAdding?1:-1;
        for (int i = start+step; (isAdding?i<=end:i>=end) && !weakSelf.operation.cancelled; i+=step) {
            _progress = i;
            [self performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:YES];
        }
    }];
    [[[NSOperationQueue alloc] init] addOperation:self.operation];
}

- (void) drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    CGContextSaveGState(ctx);
    
    CGFloat radius = MIN(self.bounds.size.height, self.bounds.size.width) * .5;
    
    //内切正方形起始位置
    CGFloat x = radius * 2 == self.bounds.size.width ? 0 : (self.bounds.size.width - radius *2 ) * .5;
    CGFloat y = radius * 2 == self.bounds.size.height ? 0 : (self.bounds.size.height - radius * 2 ) * .5;
    
    //绘制底部圆
    CGContextBeginPath(ctx);
    CGContextSetStrokeColor(ctx, CGColorGetComponents(self.style.backgroundColor.CGColor));
    CGContextAddArc(ctx, x+radius, y+radius, radius-self.style.foregoundWidth*.5, 0, M_PI*2, 1);
    CGContextSetLineWidth(ctx, self.style.foregoundWidth);
    CGContextStrokePath(ctx);
    
    
    //进度圈起始角度
    CGFloat startAngle;
    switch (self.style.cycleStartAngle) {
        case ZFProgressStartAngleLeft: {
            startAngle = M_PI;
            break;
        }
        case ZFProgressStartAngleTop: {
            startAngle = -M_PI_2;
            break;
        }
        case ZFProgressStartAngleRight: {
            startAngle = 0;
            break;
        }
        case ZFProgressStartAngleBottom: {
            startAngle = M_PI_2 ;
            break;
        }
    }
    
    //绘制前景圆
    CGContextBeginPath(ctx);
    CGContextSetStrokeColor(ctx, CGColorGetComponents(self.style.foregroundColor.CGColor));
    CGContextSetLineWidth(ctx, self.style.foregoundWidth*.9);
    CGContextSetLineCap(ctx, self.style.arrowStyle == ZFProgressArrowStyleRound?kCGLineCapRound:kCGLineCapSquare);
    CGContextSetLineJoin(ctx, self.style.arrowStyle == ZFProgressArrowStyleRound?kCGLineJoinRound:kCGLineJoinMiter);
    CGFloat endAngle = startAngle + M_PI * 2 *(self.progress * 0.01) * (self.style.isClockwised?1.:-1.);
    CGContextAddArc(ctx, x+radius, y+radius,
                    radius-self.style.foregoundWidth*.5,
                    startAngle,
                    endAngle,
                    self.style.isClockwised?0:1);
    CGContextStrokePath(ctx);
    
    //绘制text
    NSString *text = [NSString stringWithFormat:@"%u%%",self.progress];
    NSDictionary *fontAttr = @{NSFontAttributeName:self.style.textFont,
                               NSForegroundColorAttributeName:self.style.textFontColor,
                               NSBackgroundColorAttributeName:[UIColor clearColor]};
    CGSize textSize = [text sizeWithAttributes:fontAttr];
    CGPoint targetPoint;
    switch (self.style.textPosition) {
        case ZFProgressTextPoistionOnprogress://随着进度圈移动
        {
            CGFloat r = radius - self.style.foregoundWidth-textSize.height*.5;
            CGContextBeginPath(ctx);
//            CGContextSetLineWidth(ctx, 1.0);
//            CGContextSetStrokeColor(ctx, CGColorGetComponents([UIColor redColor].CGColor));
            CGContextAddArc(ctx, x+radius, y+radius,
                            r,
                            startAngle,
                            startAngle + M_PI * 2 *(self.progress * .01),
                            self.style.isClockwised?0:1);
            
            CGPoint centerPoint = CGContextGetPathCurrentPoint(ctx);
//            CGContextStrokePath(ctx);
            CGFloat px,py;
            px = centerPoint.x - textSize.width*.5;
            py = centerPoint.y - textSize.height *.5;
            targetPoint = CGPointMake(px, py);
            break;
        }
        case ZFProgressTextPoistionCenter://绘制在圆心上
        default:
            targetPoint = CGPointMake(x+radius-textSize.width*.5, y+radius-textSize.height*.5);
            break;
    }
    [text drawAtPoint:targetPoint withAttributes:fontAttr];
    CGContextRestoreGState(ctx);
    
}

@end
