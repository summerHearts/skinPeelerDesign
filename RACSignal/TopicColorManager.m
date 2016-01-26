//
//  TopicColorManager.m
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SystemSettingManager.h"

#import "TopicColorManager.h"

static NSString *const TopicChangeTopicNotication = @"TopicChangeTopicNotication";
static TopicColorManager *_sharedInstance ;
@implementation TopicColorManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TopicColorManager alloc] init];
    });
    return _sharedInstance;
}

-(id)copyWithZone:(NSZone *)zone{
    return _sharedInstance;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [super allocWithZone:zone];
        
    });
    return _sharedInstance;
}



//这个方法应该分离在model中，从本地读取当前的主题模式，更改后我们只需要更改本地数据 然后重新调用这个方法即可
-(void)getTopicModel{
    //从本地读取
    NSInteger  topic = [SystemSettingManager sharedInstance].topic;
  
    switch (topic) {
           
        case dayTime:
        {
            //这里面定义一些白天模式下 控件的颜色属性 也可以定义其他
            _navColor=[UIColor colorWithRed:10/255.0 green:85/255.0 blue:160/255.0 alpha:1];
            _bgColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
            _btnColor=[UIColor colorWithRed:10/255.0 green:85/255.0 blue:160/255.0 alpha:1];
            _textColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
            _btnTextColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
            _navTextColor= [UIColor whiteColor];
            _tableViewColor = [UIColor whiteColor];
            _tableViewCellColor = [UIColor whiteColor];
            _cellThemeTitleColor = [UIColor blackColor];
        }
            break;
        case nightTime:
        {
            //这里面定义夜间模式下的相关控件的颜色属性
            _navColor=[UIColor colorWithRed:10/255.0 green:85/255.0 blue:160/255.0 alpha:1];
            _bgColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
            _btnColor=[UIColor colorWithRed:10/255.0 green:85/255.0 blue:160/255.0 alpha:1];
            _textColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
            _btnTextColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
            _navTextColor= [UIColor whiteColor];
            _tableViewColor = [UIColor blackColor];
            _tableViewCellColor = [UIColor blackColor];
            _cellThemeTitleColor = [UIColor whiteColor];


        }
            break;
        default:
            break;
    }
}
//发送更改主题的消息
+(void)postTopicChangeMessage{
    [[NSNotificationCenter defaultCenter]postNotificationName:TopicChangeTopicNotication object:nil];
}

@end
