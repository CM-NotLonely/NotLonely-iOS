//
//  DetPublishModel.h
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "DetPublishDetModel.h"

@interface DetPublishModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSMutableArray *relationList;
@property (strong, nonatomic) DetPublishModel *initiator;

@end
