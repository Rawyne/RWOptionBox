//
//  ViewController.m
//  OptionBox
//
//  Created by 许宗城 on 16/6/20.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import "ViewController.h"
#import "RWOptionBox.h"

@interface ViewController ()


@property (nonatomic, strong) RWOptionBox *leftBox;
@property (nonatomic, strong) RWOptionBox *midBox;
@property (nonatomic, strong) RWOptionBox *rightBox;

@property (nonatomic, weak) UIButton *leftBtn;
@property (nonatomic, weak) UIButton *midBtn;
@property (nonatomic, weak) UIButton *rightBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn setTitle:@"添加" forState:UIControlStateNormal];
    leftBtn.bounds = CGRectMake(0, 0, 45, 30);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.leftBtn = leftBtn;
    [leftBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *midBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [midBtn setTitle:@"添加" forState:UIControlStateNormal];
    midBtn.bounds = CGRectMake(0, 0, 50, 30);
    self.navigationItem.titleView = midBtn;
    self.midBtn = midBtn;
    [midBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBtn setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    rightBtn.bounds = CGRectMake(0, 0, 30, 30);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.rightBtn = rightBtn;
    [rightBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    CGRect leftRect = [leftItem.customView convertRect:leftItem.customView.bounds toView:self.view];
    RWOptionBox *leftBox = [[RWOptionBox alloc] initWithContentView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 150)]];
    [leftBox setDisplayView:self.view anchorRect:leftRect alignment:RWOptionBoxAnchorAlignmentLeft margin:10];
    self.leftBox = leftBox;
    
    
    CGRect midRect = [midBtn convertRect:midBtn.bounds toView:self.view];
    RWOptionBox *midBox = [[RWOptionBox alloc] initWithContentView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 180)]];
    [midBox setDisplayView:self.view anchorRect:midRect alignment:RWOptionBoxAnchorAlignmentCenter margin:10];
    self.midBox = midBox;
    
    
    CGRect rightRect = [rightBtn convertRect:rightBtn.bounds toView:self.view];
    RWOptionBox *rightBox = [[RWOptionBox alloc] initWithContentView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 170)]];
    [rightBox setDisplayView:self.view anchorRect:rightRect alignment:RWOptionBoxAnchorAlignmentRight margin:10];
    self.rightBox = rightBox;
}

- (void)action:(UIButton *)sender {
    
    if (sender == self.leftBtn) {
        
        [self.leftBox appear];
        
        
    } else if (sender == self.midBtn) {
        
        [self.midBox appear];
        
    } else if (sender == self.rightBtn) {
        
        [self.rightBox appear];
        
        
    }
    
    
    
}

@end
