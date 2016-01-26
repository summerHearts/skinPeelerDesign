//
//  ThemeCell.h
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableCell.h"
@interface ThemeCell : BaseTableCell

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeTitleLabel;




@end
