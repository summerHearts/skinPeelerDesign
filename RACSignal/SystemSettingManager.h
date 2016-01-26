//
//  SystemSettingManager.h
//  RACSignal
//
//  Created by 佐毅 on 16/1/26.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemSettingManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic,assign) NSInteger topic;

@end
