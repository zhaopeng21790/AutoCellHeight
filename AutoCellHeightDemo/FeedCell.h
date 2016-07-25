//
//  FeedCell.h
//  AutoCellHeightDemo
//
//  Created by 赵朋 on 16/7/25.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedEntity.h"

@interface FeedCell : UITableViewCell

/*  */
@property (nonatomic, strong) FeedEntity *entity;


@property (nonatomic, weak)  UILabel *titleLabel;
@property (nonatomic, weak)  UILabel *contentLabel;
@property (nonatomic, weak)  UIImageView *contentImageView;
@property (nonatomic, weak)  UILabel *usernameLabel;
@property (nonatomic, weak)  UILabel *timeLabel;

@end
