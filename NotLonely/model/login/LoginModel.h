//
//  LoginModel.h
//  NotLonely
//
//  Created by tesths on 11/11/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface LoginModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSMutableArray *tag;

@end
