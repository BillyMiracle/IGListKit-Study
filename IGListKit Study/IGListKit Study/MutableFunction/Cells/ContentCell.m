//
//  ContentCell.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "ContentCell.h"

@implementation ContentCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
//        [self.contentView addSubview:self.foldButton];
//        [self.contentView.layer addSublayer:self.separator];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (UIFont *)font {
    return [UIFont systemFontOfSize:17.0];
}

+ (UIEdgeInsets)insets {
    return UIEdgeInsetsMake(8, 15 + 40, 8, 15);
}

+ (UIEdgeInsets)foldInsets {
    return UIEdgeInsetsMake(8, 15 + 40, 8 + 30, 15);
}

+ (CGFloat)singleLineHeight {
    return self.font.lineHeight + self.insets.top + self.insets.bottom;
}

+ (CGFloat)lineHeight:(NSString *)text width:(CGFloat)width {
    CGSize constrainedSize = CGSizeMake(width - self.insets.left - self.insets.right, FLT_MAX);
    
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    
    CGRect bounds = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return (ceil(bounds.size.height) > ContentCell.fourLineHeight ? ContentCell.fourLineHeight : ceil(bounds.size.height)) + self.insets.top + self.insets.bottom;
}

+ (BOOL)shouldFold:(NSString *)text width:(CGFloat)width {
    CGSize constrainedSize = CGSizeMake(width - self.insets.left - self.insets.right, FLT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    CGRect bounds = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return ceil(bounds.size.height) > ContentCell.fourLineHeight;
}

+ (CGFloat)fourLineHeight {
    NSString *text = @"1\n1\n1\n1";
    CGSize constrainedSize = CGSizeMake(100, FLT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    CGRect bounds = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return ceil(bounds.size.height);
}

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width {
    CGSize constrainedSize = CGSizeMake(width - self.insets.left - self.insets.right, FLT_MAX);
    
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    
    CGRect bounds = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return ceil(bounds.size.height) + self.insets.top + self.insets.bottom;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 4;
        _label.font = ContentCell.font;
    }
    return _label;
}

- (UIButton *)foldButton {
    if (!_foldButton) {
        _foldButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _foldButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_foldButton setTintColor:[UIColor colorWithRed:0.05 green:0.4 blue:0.99 alpha:1]];
        [_foldButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    }
    return _foldButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    if ([ContentCell shouldFold:_label.text width:bounds.size.width]) {
        [self.contentView addSubview:self.foldButton];
        _label.frame = UIEdgeInsetsInsetRect(bounds, ContentCell.foldInsets);
        _foldButton.frame = CGRectMake(15 + 40, bounds.size.height - 38, 40, 30);
    } else {
        _label.frame = UIEdgeInsetsInsetRect(bounds, ContentCell.insets);
        [_foldButton removeFromSuperview];
    }
}

//- (void)setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
//    self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1];
//}

- (void)press {
    [self.delegate fold];
}

@end
