//
//  ImageCell.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/28.
//

#import "ImageCell.h"

@implementation ImageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.myImageView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (UIEdgeInsets)insets {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (UIImageView *)myImageView {
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc] init];
    }
    return _myImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    _myImageView.frame = UIEdgeInsetsInsetRect(bounds, [ImageCell insets]);
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1];
}

@end
