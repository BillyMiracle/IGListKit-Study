//
//  AuthorCell.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AuthorCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *label;

//+ (CGFloat)singleLineHeight;

@end

NS_ASSUME_NONNULL_END
