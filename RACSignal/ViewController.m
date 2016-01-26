//
//  ViewController.m
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "TopicColorManager.h"
#import "SystemSettingManager.h"
#import "ThemeCell.h"

static NSString *const ThemeCellIdentifier = @"ThemeCellIdentifier";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)IBOutlet UILabel   *phoneLabel;
@property (nonatomic,strong)IBOutlet UIButton  *registBtn;

@property (nonatomic,strong)IBOutlet UISwitch *switchBtn;

@property (nonatomic,strong)IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setDelegate: self];
    [self.tableView setDataSource:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"ThemeCell" bundle:nil] forCellReuseIdentifier:ThemeCellIdentifier];
    
    [self.switchBtn addTarget:self action:@selector(switchBtnAction:) forControlEvents:UIControlEventValueChanged];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ThemeCell *themeCell = [tableView dequeueReusableCellWithIdentifier:ThemeCellIdentifier];
    [self changeThemeColorCell:themeCell];
    return themeCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}

- (void)changeThemeColorCell:(ThemeCell *)themeCell{
    TopicColorManager * model = [TopicColorManager sharedInstance];
    //加载模型数据
    [model getTopicModel];
    themeCell.contentView.backgroundColor = model.tableViewCellColor;
    themeCell.themeTitleLabel.textColor = model.cellThemeTitleColor;
  
}
- (void)switchBtnAction:(UISwitch *)swithBtn{
    
    if ([SystemSettingManager sharedInstance].topic ==1) {
        [SystemSettingManager sharedInstance].topic = 0;
    }else{
        [SystemSettingManager sharedInstance].topic = 1;
    }
    //viewController 的颜色配置
    [TopicColorManager postTopicChangeMessage];
    //cell的颜色配置
    
    [self.tableView reloadData];
}
- (void)useTopicToCreatViewWithModel{
    //获取到模型
    TopicColorManager * model = [TopicColorManager sharedInstance];
    //加载模型数据
    [model getTopicModel];
    //进行设置
    _tableView.backgroundColor = model.tableViewColor;
    self.view.backgroundColor = model.bgColor;
    _phoneLabel.textColor = model.textColor;
    [_registBtn setTitleColor:model.btnTextColor forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
