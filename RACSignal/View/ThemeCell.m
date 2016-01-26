//
//  ThemeCell.m
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

#import "ThemeCell.h"
#import "TopicColorManager.h"
#import "SystemSettingManager.h"
@implementation ThemeCell

- (void)awakeFromNib {
        //获取到模型
        TopicColorManager * model = [TopicColorManager sharedInstance];
        //加载模型数据
        [model getTopicModel];
        //进行设置
    
        self.contentView.backgroundColor =  model.tableViewCellColor;
        self.themeTitleLabel.textColor = model.cellThemeTitleColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
