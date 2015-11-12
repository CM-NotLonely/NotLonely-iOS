//
//  SquareModel.h
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SquareModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSMutableArray *items;
@end
