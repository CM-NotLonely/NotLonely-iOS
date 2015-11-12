//
//  NetWork.h
//  RacNetWork
//
//  Created by  plusub on 9/26/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking-RACExtensions/RACAFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface NetWork : NSObject
+ (instancetype)sharedManager;
#pragma mark 登陆注册
- (RACSignal *)request_Login:(NSDictionary *)para;
- (RACSignal *)request_Register:(NSDictionary *)para;
- (RACSignal *)request_DetInf:(NSDictionary *)para;

#pragma mark 发布活动
- (RACSignal *)request_ADDNA:(NSDictionary *)para;

#pragma mark 广场
- (RACSignal *)request_Square:(NSDictionary *)para;
- (RACSignal *)request_Takein:(NSDictionary *)para;

#pragma mark 我的发布
- (RACSignal *)request_MyPublish:(NSDictionary *)para;
- (RACSignal *)request_DeleteMyPublish:(NSDictionary *)para;
- (RACSignal *)request_CloseMyPublish:(NSDictionary *)para;

#pragma mark 活动参与者
- (RACSignal *)request_DetMyPublish:(NSDictionary *)para;
- (RACSignal *)request_OtherMyPublish:(NSDictionary *)para;

- (RACSignal *)request_AgreeMyPublish:(NSDictionary *)para;

#pragma mark 评论
- (RACSignal *)request_Comment:(NSDictionary *)para;

#pragma mark 获取参与者电话
- (RACSignal *)request_MPhone:(NSDictionary *)para;
#pragma mark 获取个人信息
- (RACSignal *)request_Inf:(NSDictionary *)para;

#pragma mark 我参与的
- (RACSignal *)request_MyRequest:(NSDictionary *)para;


#pragma mark 图片上传
- (RACSignal *)UploadPic:(NSURL *)filePath;
@end
