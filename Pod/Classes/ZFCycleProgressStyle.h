//
//  ZFCycleProgressStyle.h
//  ZFCycleProgressView
//
//  Created by 周峰 on 15/10/31.
//  Copyright © 2015年 Feng.z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ZFProgressTextPoistion) {
    ZFProgressTextPoistionCenter,
    ZFProgressTextPoistionOnprogress,/**< 文字跟随进度条移动  */
};

typedef NS_ENUM(NSInteger,ZFProgressArrowStyle) {
    ZFProgressArrowStyleRound,/**< 圆角  */
    ZFProgressArrowStyleAngle/**< 直角  */
};

typedef NS_ENUM(NSInteger,ZFProgressStartAngle) {
    ZFProgressStartAngleLeft,
    ZFProgressStartAngleTop,
    ZFProgressStartAngleRight,
    ZFProgressStartAngleBottom
};

@interface ZFCycleProgressStyle : NSObject

@property (strong ,nonatomic) UIFont                 *textFont;
@property (strong ,nonatomic) UIColor                *textFontColor;
@property (strong ,nonatomic) UIColor                *backgroundColor;
@property (strong ,nonatomic) UIColor                *foregroundColor;
@property (assign ,nonatomic) CGFloat                foregoundWidth;
@property (assign ,nonatomic) BOOL                   isClockwised;/**< 进度条是否顺时针方向  */
@property (assign ,nonatomic) ZFProgressTextPoistion textPosition;
@property (assign ,nonatomic) ZFProgressArrowStyle   arrowStyle;
@property (assign ,nonatomic) ZFProgressStartAngle   cycleStartAngle;

+ (instancetype) defaultStyle;


@end
