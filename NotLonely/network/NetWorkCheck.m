//
//  NetWorkCheck.m
//  RacNetWork
//
//  Created by  plusub on 9/26/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//
#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]


#import "NetWorkCheck.h"
#import "NetWork.h"


@implementation NetWorkCheck

static NetWorkCheck *_sharedClient = nil;
static dispatch_once_t onceToken;


+ (NetWorkCheck *)sharedJsonClient {
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer.timeoutInterval = 1;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
    
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}

- (RACSignal *)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
{
    return [self requestJsonDataWithPath:aPath withParams:params withMethodType:method autoShowError:YES];
}


- (RACSignal *)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
{
    UIView *view = [UIApplication sharedApplication].delegate.window ;
    [CustomHud showHUDAddedTo:view animated:YES];

    //log请求数据
    DebugLog(@"\n===========request===========\n%@\n%@:\n%@", kNetworkMethodName[method], aPath, params);
    //    发起请求
    switch (method) {
        case Get:{
            return [[[[self rac_GET:aPath parameters:params] map:^id(RACTuple *JSONAndHeaders) {
                NSDictionary *responseObject = JSONAndHeaders[0];
                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject autoShowError:autoShowError rerequestJsonDataWithPath:aPath withParams:params];
                if (error) {
                    return RACTuplePack(nil, error);
                }else{
                    return RACTuplePack(responseObject, nil);
                }
            }]
              catch:^RACSignal *(NSError *error) {
                  [CustomHud hideHUDForView:view animated:YES];
                  DebugLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                  return [self showError:error];
              }] replayLazily];
            break;
        }
        case Post:{
            return [[[[self rac_POST:aPath parameters:params] map:^id(RACTuple *JSONAndHeaders) {
                NSDictionary *responseObject = JSONAndHeaders[0];
                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject autoShowError:autoShowError rerequestJsonDataWithPath:aPath withParams:params];
                if (error) {
                    return RACTuplePack(nil, error);
                }else{
                    return RACTuplePack(responseObject, nil);
                }
            }]
              catch:^RACSignal *(NSError *error) {
                  [CustomHud hideHUDForView:view animated:YES];
                  DebugLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                  return [self showError:error];
              }] replayLazily];
            break;
        }
        default:
            break;
    }
    return 0;
}
- (RACSignal *)uploadImageWithPath:(NSString *)aPath
                          withFile:(NSURL*)filePath
{
    return [RACSignal createSignal:^ RACDisposable * (id<RACSubscriber> subscriber) {
        [self POST:aPath parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileURL:filePath name:@"upload_avatar" error:nil];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
            id error = [self handleResponse:responseObject autoShowError:YES rerequestJsonDataWithPath:aPath withParams:nil];
            if (error) {
                [subscriber sendNext:RACTuplePack(nil, error)];
            }else{
                [subscriber sendNext:RACTuplePack(responseObject, nil)];
            }
            [subscriber sendCompleted];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}
#pragma mark NetError
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError
rerequestJsonDataWithPath:(NSString *)aPath
         withParams:(NSDictionary*)params {
    NSError *error = nil;
    //code为非0值时，表示有错
    NSNumber *resultCode = [responseJSON valueForKeyPath:@"status"];
    
    if (resultCode.integerValue != 0) {
        if (resultCode.integerValue == -3) {
            [self showHudTipStr:@"已经评论过啦~"];
        } else {
            error = [NSError errorWithDomain:BASE_URL code:resultCode.intValue userInfo:responseJSON];
            if (autoShowError) {
                [self showError:error];
            }
        }

    }
    return error;
}

- (RACSignal *)showError:(NSError *)error
{
    if (error.code == NSURLErrorTimedOut) {
        [self showHudTipStr:@"服务器开了个小差~"];
    } else {
        NSString *tipStr = [self tipFromError:error];
        [self showHudTipStr:tipStr];
    }
    return [RACSignal error:error];
}
@end
