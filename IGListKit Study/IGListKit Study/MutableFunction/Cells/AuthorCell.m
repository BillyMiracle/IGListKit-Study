//
//  AuthorCell.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "AuthorCell.h"

@implementation AuthorCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.headImageView];
//        [self.contentView.layer addSublayer:self.separator];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (UIFont *)font {
    return [UIFont boldSystemFontOfSize:19];
}

//+ (UIEdgeInsets)insets {
//    return UIEdgeInsetsMake(10, 15, 10, 15);
//}
//
//+ (CGFloat)singleLineHeight {
//    return self.font.lineHeight + self.insets.top + self.insets.bottom;
//}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 1;
        _label.textColor = [UIColor colorWithRed:0.3 green:0.12 blue:0.9 alpha:1];
        _label.font = AuthorCell.font;
    }
    return _label;
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
    }
    return _headImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    _headImageView.frame = CGRectMake(10, 5, 40, 40);
    _label.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(10, 10 + 40 + 5, 10, 15));
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1];
}

@end
