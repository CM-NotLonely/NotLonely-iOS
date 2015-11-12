//
//  MyReceiveModel.h
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "MyReceiveDetModel.h"

@interface MyReceiveModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSMutableArray *myRequestList;
@property (strong, nonatomic) MyReceiveDetModel *initiator;
@end
