//
//  MyPublishModel.h
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MyPublishModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSMutableArray *myPostList;

@end
