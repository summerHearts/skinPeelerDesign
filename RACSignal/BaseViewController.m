//
//  BaseViewController.m
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "TopicColorManager.h"
static NSString *const TopicChangeTopicNotication = @"TopicChangeTopicNotication";

@interface BaseViewController ()<TopicProcotol>

@end

@implementation BaseViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(useTopicToCreatViewWithModel) name:TopicChangeTopicNotication object:nil];
    
    [self useTopicToCreatViewWithModel];
}

//子类实现如下方法
-(void)useTopicToCreatViewWithModel{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
