//
//  FeedEntity.h
//  AutoCellHeightDemo
//
//  Created by 赵朋 on 16/7/25.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedEntity : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;

@end
