//
//  MyPublishTableViewCell.h
//  NotLonely
//
//  Created by tesths on 10/16/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPublishDetModel.h"

@protocol MyPublishTableViewCellDelegate <NSObject>

- (void)closeActivity:(MyPublishDetModel *)model androw:(NSInteger)row;

@end

@interface MyPublishTableViewCell : UITableViewCell
- (void)setCellData:(MyPublishDetModel *)mypublishModel androw:(NSInteger)row;
@property (assign, nonatomic) id<MyPublishTableViewCellDelegate> delegate;
@end
