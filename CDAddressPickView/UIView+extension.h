//
//  UIView+extension.h
//  CDChat
//
//  Created by 吴文海 on 2019/3/7.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extension)
@property (nonatomic, assign) CGFloat x; // x值
@property (nonatomic, assign) CGFloat y; // y值
@property (nonatomic, assign) CGFloat width; // 宽
@property (nonatomic, assign) CGFloat height; // 高
@property (nonatomic, assign) CGSize  size; // size
@property (nonatomic, assign) CGPoint origin; // 点
@property (nonatomic, assign) CGFloat centerX; // 中心点X值
@property (nonatomic, assign) CGFloat centerY; // 中心点Y值



@property (nonatomic,assign)  CGFloat bottom; // 到底部的距离
@property (nonatomic,assign)  CGFloat right; // 到右边的距离
@end
