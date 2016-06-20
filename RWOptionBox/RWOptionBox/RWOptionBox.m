//
//  RWOptionBox.m
//  Demo
//
//  Created by 许宗城 on 16/6/18.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import "RWOptionBox.h"


@interface RWOptionBox ()

@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, strong) UIView *container;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, weak) UIView *displayView;
@property (nonatomic, assign) CGRect anchorRect;
@property (nonatomic, assign) RWOptionBoxAnchorAlignment alignment;
@property (nonatomic, assign) CGFloat margin;

@end

@implementation RWOptionBox
{
    CGFloat _yOffset;
}

- (instancetype)initWithContentView:(UIView *)contentView {
    if (self = [super init]) {
        _yOffset = 8;
        
        _contentView = contentView;
        
        UIView *container = [[UIView alloc] init];
        container.bounds = CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height + _yOffset);
        self.container = container;
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.687].CGColor;
        [container.layer addSublayer:shapeLayer];
        self.shapeLayer = shapeLayer;
        
        contentView.frame = CGRectMake(0, _yOffset, contentView.frame.size.width, contentView.frame.size.height);
        [container addSubview:contentView];
        
        
        UIView *coverView = [[UIView alloc] init];
        self.coverView = coverView;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [coverView addGestureRecognizer:tap];
    }
    return self;
}



- (void)setDisplayView:(UIView *)displayView anchorRect:(CGRect)anchorRect alignment:(RWOptionBoxAnchorAlignment)alignment margin:(CGFloat)margin {
    self.margin = margin;
    self.anchorRect = anchorRect;
    self.displayView = displayView;
    self.alignment = alignment;
    
    [self setupContainer];
}

- (void)setupContainer {
    self.coverView.frame = self.displayView.bounds;
    [self.displayView addSubview:self.coverView];
    
    CGFloat anchorPointX;
    CGFloat anchorOffsetX;
    if (self.alignment == RWOptionBoxAnchorAlignmentLeft) {
        anchorOffsetX = self.anchorRect.size.width / 2;
        
    } else if (self.alignment == RWOptionBoxAnchorAlignmentRight) {
        anchorOffsetX = self.container.frame.size.width - self.anchorRect.size.width / 2;
        
    } else {
        anchorOffsetX = self.container.frame.size.width / 2;
    }
    
    anchorPointX = anchorOffsetX / self.container.frame.size.width;
    
    CGFloat inflectLeft = anchorOffsetX - 4;
    CGFloat inflectRight = anchorOffsetX + 4;
    
    CGFloat minX = 0;
    CGFloat maxX = self.container.frame.size.width;
    CGFloat minY = _yOffset;
    CGFloat maxY = self.container.frame.size.height;
    CGFloat cornerRadius = 3;
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(minX, maxY / 2)]; //左中开始
    [path addLineToPoint:CGPointMake(minX, minY + cornerRadius)];
    [path addQuadCurveToPoint:CGPointMake(minX + cornerRadius, minY) controlPoint:CGPointMake(minX, minY)];
    
    [path addLineToPoint:CGPointMake(inflectLeft, minY)];
    [path addLineToPoint:CGPointMake(anchorOffsetX, 0)];
    [path addLineToPoint:CGPointMake(inflectRight, minY)];
    
    [path addLineToPoint:CGPointMake(maxX - cornerRadius, minY)];
    [path addQuadCurveToPoint:CGPointMake(maxX, minY + cornerRadius) controlPoint:CGPointMake(maxX, minY)];
    
    [path addLineToPoint:CGPointMake(maxX, maxY - cornerRadius)];
    [path addQuadCurveToPoint:CGPointMake(maxX - cornerRadius, maxY) controlPoint:CGPointMake(maxX, maxY)];
    
    [path addLineToPoint:CGPointMake(minX + cornerRadius, maxY)];
    [path addQuadCurveToPoint:CGPointMake(minX, maxY - cornerRadius) controlPoint:CGPointMake(minX, maxY)];
    
    [path closePath];
    self.shapeLayer.fillColor = [UIColor colorWithWhite:0.000 alpha:0.691].CGColor;
    self.shapeLayer.path = path.CGPath;
    
    self.container.layer.anchorPoint = CGPointMake(anchorPointX, 0);
    self.container.center = CGPointMake(CGRectGetMidX(self.anchorRect), CGRectGetMaxY(self.anchorRect) + _margin);
    [self.displayView addSubview:self.container];
    
    
    self.container.hidden = YES;
    self.container.layer.affineTransform = CGAffineTransformMakeScale(0.7, 0.7);
    self.container.alpha = 0;
    self.coverView.userInteractionEnabled = NO;
}

- (void)appear {
    self.coverView.userInteractionEnabled = YES;
    self.container.hidden = NO;
    
    
    [UIView animateWithDuration:0.1 animations:^{
        self.container.layer.affineTransform = CGAffineTransformIdentity;
        self.container.alpha = 1;
    }];
    
}

- (void)disappear {
    self.coverView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.container.alpha = 0;
        self.container.layer.affineTransform = CGAffineTransformMakeScale(0.7, 0.7);
    } completion:^(BOOL finished) {
        if (finished) {
            self.container.hidden = YES;
        }
    }];
}

- (void)handleGesture:(UITapGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateEnded) {
        [self disappear];
    }
}





@end
