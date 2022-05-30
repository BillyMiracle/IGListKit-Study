//
//  AuthorSectionController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "AuthorSectionController.h"
#import "AuthorCell.h"
#import <SDWebImage.h>
@implementation AuthorSectionController

- (NSInteger)numberOfItems {
    //相当于UITableView一个indexPath.setion中有几个row
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    //返回cell大小
    CGFloat width = [self.collectionContext containerSize].width;
    
    return CGSizeMake(width, 50);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    //返回cell
    AuthorCell *cell = [self.collectionContext dequeueReusableCellOfClass:[AuthorCell class] forSectionController:self atIndex:index];
    cell.label.numberOfLines = 1;
    cell.label.text = _model.name;
    [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:_model.headImageUrl] placeholderImage:nil options:SDWebImageProgressiveLoad completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
    }];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    //绑定model
    _model = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    //一个row的点击事件
    
    return;
}

@end
