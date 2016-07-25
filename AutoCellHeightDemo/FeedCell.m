//
//  FeedCell.m
//  AutoCellHeightDemo
//
//  Created by 赵朋 on 16/7/25.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import "FeedCell.h"
#import "Masonry.h"


@implementation FeedCell




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self masonry];
    }
    return self;
}

- (void)masonry {

    int magin = 5;
    int padding = 10;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(self.contentView).offset(padding);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padding);
    }];
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(magin);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(magin);
    }];
    
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left).offset(0);
        make.top.mas_equalTo(self.contentImageView.mas_bottom).offset(magin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-padding);
    }];
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.mas_equalTo(self.usernameLabel);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padding);
    }];
    
}


//重写这个方法 
- (CGSize)sizeThatFits:(CGSize)size {
    
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contentLabel sizeThatFits:size].height;
    totalHeight += [self.contentImageView sizeThatFits:size].height;
    totalHeight += [self.usernameLabel sizeThatFits:size].height;
    totalHeight += 35; // margins
    return CGSizeMake(size.width, totalHeight);
    
}


- (void)setEntity:(FeedEntity *)entity {
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.usernameLabel.text = entity.username;
    self.timeLabel.text = entity.time;
    
}




#pragma mark - getter

- (UIImageView *)contentImageView {
    if (_contentImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        _contentImageView = imageView;
        [self.contentView addSubview:_contentImageView];
    }
    
    return _contentImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        
        _titleLabel = titleLabel;
        
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.numberOfLines = 0;
        
        _contentLabel = titleLabel;
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}


- (UILabel *)usernameLabel {
    if (!_usernameLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        _usernameLabel = titleLabel;
        [self.contentView addSubview:_usernameLabel];
    }
    return _usernameLabel;
}



- (UILabel *)timeLabel {
    if (!_timeLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel = titleLabel;
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
