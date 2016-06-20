//
//  ContentView.m
//  RWOptionBox
//
//  Created by 许宗城 on 16/6/20.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import "ContentView.h"


@interface ContentView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 38;
        [self addSubview:tableView];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorColor = [UIColor whiteColor];
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    cell.textLabel.text = @"cell";
    
    return cell;
}

@end
