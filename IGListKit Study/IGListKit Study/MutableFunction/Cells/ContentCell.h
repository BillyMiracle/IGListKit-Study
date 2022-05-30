//
//  ContentCell.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Fold <NSObject>

- (void)fold;

@end


@interface ContentCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, assign) NSInteger index;

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width;
+ (CGFloat)singleLineHeight;
+ (CGFloat)lineHeight:(NSString *)text width:(CGFloat)width;
+ (BOOL)shouldFold:(NSString *)text width:(CGFloat)width;

@property (nonatomic, weak) id <Fold> delegate;

@end

NS_ASSUME_NONNULL_END
