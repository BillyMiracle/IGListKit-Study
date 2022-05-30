//
//  ImageSectionController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "ImageSectionController.h"
#import "ImageCell.h"
#import <SDWebImage.h>

@implementation ImageSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
        self.inset = UIEdgeInsetsMake(0, 55, 0, 55);
    }
    return self;
}

- (NSInteger)numberOfItems {
    //相当于UICollectionView一个indexPath.setion中有几个row
    return _model.imageUrls.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [self.collectionContext containerSize].width - 110;
    CGFloat itemSize = floor(width / 3);
    //返回cell大小
    return CGSizeMake(itemSize, itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    //返回cell
    ImageCell *cell = [self.collectionContext dequeueReusableCellOfClass:[ImageCell class] forSectionController:self atIndex:index];
    [cell.myImageView sd_setImageWithURL:_model.imageUrls[index] placeholderImage:nil options:SDWebImageProgressiveLoad completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        cell.myImageView.image = [self cropSquareImage:image];
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

- (UIImage *)cropSquareImage:(UIImage *)image {
    CGFloat _imageWidth = image.size.width * image.scale;
    CGFloat _imageHeight = image.size.height * image.scale;
    if (_imageWidth == _imageHeight) {
        return image;
    }
    CGImageRef sourceImageRef = [image CGImage];//将UIImage转换成CGImageRef
    CGFloat _width = _imageWidth > _imageHeight ? _imageHeight : _imageWidth;
    CGFloat _offsetX = (_imageWidth - _width) / 2;
    CGFloat _offsetY = (_imageHeight - _width) / 2;
    CGRect rect = CGRectMake(_offsetX, _offsetY, _width, _width);
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);//按照给定的矩形区域进行剪裁
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

@end
