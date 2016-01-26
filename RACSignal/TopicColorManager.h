//
//  TopicColorManager.h
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//



#import <Foundation/Foundation.h>

typedef enum {
    dayTime=0,
    nightTime
}TopicModel;
@protocol TopicProcotol <NSObject>

@required

-(void)useTopicToCreatViewWithModel;
@end


@interface TopicColorManager : NSObject

+ (instancetype)sharedInstance;

-(void)getTopicModel;

+(void)postTopicChangeMessage;

@property (nonatomic,copy) UIColor * navColor;
@property (nonatomic,copy) UIColor * bgColor;

@property (nonatomic,copy) UIColor * btnColor;
@property (nonatomic,copy) UIColor * textColor;

@property (nonatomic,copy) UIColor * btnTextColor;
@property (nonatomic,copy) UIColor * navTextColor;

@property (nonatomic,copy) UIColor *tableViewColor;
@property (nonatomic,copy) UIColor *tableViewCellColor;
@property (nonatomic,copy) UIColor *cellThemeTitleColor;
@property (nonatomic,copy) UIColor *navBarColor;


@end
