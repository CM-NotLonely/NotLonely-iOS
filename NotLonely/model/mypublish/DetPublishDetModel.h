//
//  DetPublishDetModel.h
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DetPublishDetModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSNumber *personInId;
@property (strong, nonatomic) NSURL *personInAvatar;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSString *personInNickname;
@property (strong, nonatomic) NSNumber *commit;
@property (strong, nonatomic) NSNumber *relationDeal;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSArray *tag;

@end