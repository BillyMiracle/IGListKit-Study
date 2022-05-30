//
//  LabelCell.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabelCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *label;

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width;
+ (CGFloat)singleLineHeight;

@end

NS_ASSUME_NONNULL_END
