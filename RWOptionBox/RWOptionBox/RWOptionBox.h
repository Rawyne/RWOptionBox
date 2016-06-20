//
//  RWOptionBox.h
//  Demo
//
//  Created by 许宗城 on 16/6/18.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RWOptionBoxAnchorAlignment) {
    RWOptionBoxAnchorAlignmentLeft,
    RWOptionBoxAnchorAlignmentRight,
    RWOptionBoxAnchorAlignmentCenter
};

@interface RWOptionBox : NSObject

- (instancetype)initWithContentView:(UIView *)contentView;


- (void)setDisplayView:(UIView *)displayView
            anchorRect:(CGRect)anchorRect
             alignment:(RWOptionBoxAnchorAlignment)alignment
                margin:(CGFloat)margin;


- (void)appear;
- (void)disappear;

@end
