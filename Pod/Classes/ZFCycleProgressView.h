//
//  ZFCycleProgressView.h
//  ZFCycleProgressView
//
//  Created by 周峰 on 15/10/31.
//  Copyright © 2015年 Feng.z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFCycleProgressStyle.h"


@interface ZFCycleProgressView : UIView

@property(strong,nonatomic) ZFCycleProgressStyle *style;
@property(assign,nonatomic) unsigned long progress;/**< 进度值：0-100  */

- (instancetype) initWithFrame:(CGRect)frame style:(ZFCycleProgressStyle*) style;

@end
