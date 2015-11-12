//
//  NetWorkCheck.h
//  RacNetWork
//
//  Created by  plusub on 9/26/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "Url.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking-RACExtensions/RACAFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "NSObject+Common.h"

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface NetWorkCheck : AFHTTPRequestOperationManager
+ (NetWorkCheck *)sharedJsonClient;


- (RACSignal *)requestJsonDataWithPath:(NSString *)aPath
                            withParams:(NSDictionary*)params
                        withMethodType:(NetworkMethod)method;

- (RACSignal *)uploadImageWithPath:(NSString *)aPath
                          withFile:(NSURL*)filePath;
@end
