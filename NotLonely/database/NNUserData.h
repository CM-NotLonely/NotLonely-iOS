//
//  NNUserData.h
//  NotLonely
//
//  Created by tesths on 11/11/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NNGetUserData(str) [[NNUserData customDefault] objectForKey:str]

#define user_username @"username"
#define user_nickname @"nickname"
#define user_sex @"sex"

#define user_avatar @"avatar"

#define user_phone @"phone"

@interface NNUserData : NSObject
+ (NSUserDefaults *)customDefault;
+ (void)setDefaultValue:(id)item withKey:(NSString *)key;
+ (void)removeDefaultWithKey:(NSString *)key;
@end
