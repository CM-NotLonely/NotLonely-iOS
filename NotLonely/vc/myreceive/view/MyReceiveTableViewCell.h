//
//  MyReceiveTableViewCell.h
//  NotLonely
//
//  Created by tesths on 10/23/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyReceiveDetModel.h"

@protocol MyReceiveTableViewCellDelegate <NSObject>

- (void)peopleDetInf;

@end

@interface MyReceiveTableViewCell : UITableViewCell
@property (assign, nonatomic) id<MyReceiveTableViewCellDelegate> delegate;
- (void)setCellData:(MyReceiveDetModel *)myreceivedetModel;
@end
