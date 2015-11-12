//
//  NetWork.m
//  RacNetWork
//
//  Created by  plusub on 9/26/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "NetWork.h"
#import "NetWorkCheck.h"

//model
#import "LoginModel.h"
#import "SquareModel.h"
#import "MyPublishModel.h"
#import "DetPublishModel.h"
#import "MyReceiveModel.h"

@implementation NetWork
+ (instancetype)sharedManager
{
    static NetWork *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

#pragma mark 登陆注册
- (RACSignal *)request_Login:(NSDictionary *)para
{
    NSString *path = @"/login/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Post] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            LoginModel *file = [MTLJSONAdapter modelOfClass:LoginModel.class fromJSONDictionary:resultData error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_Register:(NSDictionary *)para
{
    NSString *path = @"/register/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Post] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_DetInf:(NSDictionary *)para
{
    NSString *path = @"/userSetting/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Post] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 发布活动
- (RACSignal *)request_ADDNA:(NSDictionary *)para
{
    NSString *path = @"/postActivity/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Post] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 广场
- (RACSignal *)request_Square:(NSDictionary *)para
{
    NSString *path = @"/getActivity/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            SquareModel *file = [MTLJSONAdapter modelOfClass:SquareModel.class fromJSONDictionary:resultData error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_Takein:(NSDictionary *)para
{
    NSString *path = @"/takein/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 我的发布
- (RACSignal *)request_MyPublish:(NSDictionary *)para
{
    NSString *path = @"/getMyPost/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            MyPublishModel *file = [MTLJSONAdapter modelOfClass:MyPublishModel.class fromJSONDictionary:resultData error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_CloseMyPublish:(NSDictionary *)para
{
    NSString *path = @"/closeNews/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_DeleteMyPublish:(NSDictionary *)para
{
    NSString *path = @"/removeNews/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 活动参与者
- (RACSignal *)request_DetMyPublish:(NSDictionary *)para
{
    NSString *path = @"/getMyPostAllRelation/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            DetPublishModel *file = [MTLJSONAdapter modelOfClass:DetPublishModel.class fromJSONDictionary:resultData error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_OtherMyPublish:(NSDictionary *)para
{
    NSString *path = @"/getMyRequestAllRelation/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            DetPublishModel *file = [MTLJSONAdapter modelOfClass:DetPublishModel.class fromJSONDictionary:resultData error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

- (RACSignal *)request_AgreeMyPublish:(NSDictionary *)para
{
    NSString *path = @"/confirmRelation/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 评论
- (RACSignal *)request_Comment:(NSDictionary *)para
{
    NSString *path = @"/commit/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Post] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 获取参与者电话
- (RACSignal *)request_MPhone:(NSDictionary *)para
{
    NSString *path = @"/getMyGroupTel/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            
            return RACTuplePack([resultData objectForKey:@"tel"], nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 获取个人信息
- (RACSignal *)request_Inf:(NSDictionary *)para
{
    NSString *path = @"/userInfo/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            LoginModel *file = [MTLJSONAdapter modelOfClass:LoginModel.class fromJSONDictionary:[resultData objectForKey:@"userInfo"] error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}
#pragma mark 我参与的
- (RACSignal *)request_MyRequest:(NSDictionary *)para
{
    NSString *path = @"/getMyRequest/";
    return [[[NetWorkCheck sharedJsonClient] requestJsonDataWithPath:path withParams:para withMethodType:Get] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            MyReceiveModel *file = [MTLJSONAdapter modelOfClass:MyReceiveModel.class fromJSONDictionary:resultData error:nil];
            return RACTuplePack(file, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}

#pragma mark 图片上传
- (RACSignal *)UploadPic:(NSURL *)filePath
{
    NSString *path = @"/upload_avatar/";

    return [[[NetWorkCheck sharedJsonClient] uploadImageWithPath:path withFile:filePath] map:^id(RACTuple *JSONAndHeaders) {
        id resultData = JSONAndHeaders[0];
        NSError *error = JSONAndHeaders[1];
        if (resultData) {
            return RACTuplePack(resultData, nil);
        } else {
            return RACTuplePack(nil, error);
        }
    }];
}
@end
