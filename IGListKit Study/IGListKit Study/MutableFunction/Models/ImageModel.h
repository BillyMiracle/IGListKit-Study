//
//  ImageModel.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject
<IGListDiffable>

@property (nonatomic, strong) NSMutableArray *imageUrls;

- (instancetype)initWithUrls:(NSArray *)urls;

@end

NS_ASSUME_NONNULL_END
