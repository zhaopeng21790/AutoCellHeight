//
//  FeedEntity.m
//  AutoCellHeightDemo
//
//  Created by 赵朋 on 16/7/25.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import "FeedEntity.h"

@implementation FeedEntity

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}



@end
