//
//  BaseTableCell.m
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

#import "BaseTableCell.h"

@implementation BaseTableCell

- (void)awakeFromNib {
    
    [self initViews];
    // Initialization code
}

- (void)initViews{
   
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
