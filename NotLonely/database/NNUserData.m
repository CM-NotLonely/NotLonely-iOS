//
//  NNUserData.m
//  NotLonely
//
//  Created by tesths on 11/11/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "NNUserData.h"

@implementation NNUserData
+ (NSUserDefaults *)customDefault
{
    return [NSUserDefaults standardUserDefaults];
}

+ (void)setDefaultValue:(id)item withKey:(NSString *)key
{
    NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
    [userDefatluts setObject:item forKey:key];
    [userDefatluts synchronize];
    
}
+ (void)removeDefaultWithKey:(NSString *)key
{
    NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
    [userDefatluts removeObjectForKey:key];
    [userDefatluts synchronize];
}
@end
