//
//  DetPublishTableViewCell.h
//  NotLonely
//
//  Created by  plusub on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetPublishDetModel.h"

@protocol DetPublishTableViewCellDelegate <NSObject>

- (void)peopleList;

@end

@interface DetPublishTableViewCell : UITableViewCell
@property (strong, nonatomic) NSNumber *activityId;
@property (assign, nonatomic) id<DetPublishTableViewCellDelegate> delegate;
- (void)setCellData:(DetPublishDetModel *)detpublishdetModel;
@end
