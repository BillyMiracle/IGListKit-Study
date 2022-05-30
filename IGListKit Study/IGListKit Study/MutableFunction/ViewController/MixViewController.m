//
//  MixViewController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "MixViewController.h"
#import <IGListKit.h>
#import "AuthorModel.h"
#import "ContentModel.h"
#import "ImageModel.h"
#import "ContentSectionController.h"
#import "ImageSectionController.h"
#import "AuthorSectionController.h"

@interface MixViewController ()
<IGListAdapterDataSource>

@property (nonatomic,strong) IGListAdapter *adapter;
//IGListCollectionView继承自UICollectionView,用来代替UITableView
@property (nonatomic,strong) IGListCollectionView *collectionView;
//数据源数组
@property (nonatomic,strong) NSMutableArray *data;

@property (nonatomic,strong) NSArray *segments;
@property (nonatomic,strong) NSString *selectedClass;

@end

@implementation MixViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        /**
         默认初始化IGListAdapter
         参数1：IGListAdapterUpdater，是一个遵循了IGListUpdatingDelegate的对象，它处理每行更新。
         参数2：viewController，是包含IGListAdapter的UIViewController。 可以用来push到其他控制器
         参数3：workingRangeSize是工作范围的大小，它可以让你为刚好在可见范围之外的视图做一些准备工作，暂时没用到给0。
         */
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (IGListCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero listCollectionViewLayout:[[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:NO]];
    }
    return _collectionView;
}

- (NSMutableArray *)data {
    NSString *head1 = @"https://img1.baidu.com/it/u=235631164,1853890350&fm=253&fmt=auto&app=120&f=JPEG?w=509&h=500";
    NSString *head2 = @"https://img2.baidu.com/it/u=1347252749,346830019&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head3 = @"https://img2.baidu.com/it/u=1720444668,1660517678&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head4 = @"https://img2.baidu.com/it/u=3916833205,2012938924&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=398";
    NSString *head5 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202005%2F03%2F20200503193405_QavAd.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656316966&t=c149810eddedd6a85e1f5f898a342959";
    NSString *imageURL1 = @"https://img0.baidu.com/it/u=73689209,3130028231&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500";
    NSString *imageURL2 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp06%2F200QQU3202Y7-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=54a7468dbe10ffae521dfb2e27fb444c";
    NSString *imageURL3 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp06%2F20111116192A364-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=eab84211a1ef3551eeeebd3bc9887245";
    NSString *imageURL4 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F911%2F020916103253%2F160209103253-9.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=ac032bf7894e9ac167bd0305703374d0";
    NSString *imageURL5 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242113056248-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=37663c0c40b6efde1f457d1c1300dff2";
    NSString *imageURL6 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F121R0114206%2F20121Q14206-3-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=c1291f235023f33c605a8d6ace5c747c";
    NSString *imageURL7 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1114%2F0I120152936%2F200I1152936-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=a764c64fc0b18afe56658d015bb4a909";
    NSString *imageURL8 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F21040G45I2OZ-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656320644&t=6525e4cc0bcc005da549612ca5626559";
    NSString *imageURL9 = @"https://img2.baidu.com/it/u=924133470,1725987117&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281";
    NSString *imageURL10 = @"https://img2.baidu.com/it/u=80695163,2674408883&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=347";
    NSString *imageURL11 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.2008php.com%2F2017_Website_appreciate%2F2017-12-15%2F20171215231431.jpg&refer=http%3A%2F%2Fwww.2008php.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656321729&t=6fa99377f4692c78ec03bd66a1e1b725";


    if (!_data) {
        /**
         数据源数组，数组里的model要实现IGListDiffable
         */
        _data = [NSMutableArray arrayWithObjects:
                 [[AuthorModel alloc] initWithId:@1 name:@"普信男" headImage:head1],
                 [[ContentModel alloc] initWithContent:@"头像是我，不满意？\n丫头，欲擒故纵的小把戏只能玩一次。\n眼神骗不了人。\n有没有什么漂亮的姑娘介绍给我。\n什么？你还要看条件，太现实了。\n你说气话，我不信，说不要就是要的意思，你们女人就是口是心非。\n从来都是别人追我的，你不要不知好歹。\n有照片吗？没有现在拍。"],
                 [[ImageModel alloc] initWithUrls:@[imageURL3, imageURL4, imageURL6, imageURL7, imageURL5]],
                 [[AuthorModel alloc] initWithId:@2 name:@"普信女" headImage:head2],
                 [[ContentModel alloc] initWithContent:@"你这样的，以前我是看不上的。\n别妄想了，你配不上我。\n男人，给你个机会得到我。\n你说气话，我不信。\n男人，你在害羞什么\n把你伤得太狠了，抱歉\n没人能拒绝姐，当然你也不行。\n暗恋我？"],
                 [[ImageModel alloc] initWithUrls:@[imageURL8]],
                 [[AuthorModel alloc] initWithId:@3 name:@"小可爱" headImage:head3],
                 [[ContentModel alloc] initWithContent:@"他们都想得到你的人，我不一样，我不但想得到你的人，还想得到你的钱。我家没什么钱的，唯一拿得出手的就只有我了。认识的人放眼里，重要的人放心里，垃圾人应该放进垃圾桶里。"],
                 [[ImageModel alloc] initWithUrls:@[imageURL9, imageURL11, imageURL10]],
                 [[AuthorModel alloc] initWithId:@4 name:@"搞笑男" headImage:head4],
                 [[ContentModel alloc] initWithContent:@"突然发现，我对自己未来的所有计划都有同一个开头：等我有了钱。"],
                 [[AuthorModel alloc] initWithId:@5 name:@"猪猪" headImage:head5],
                 [[ContentModel alloc] initWithContent:@"不开心睡一觉，就让他过去吧，伤心还好，伤胃就不要了。有事情是要说出来的，不要等着对方去领悟，因为对方不是你，不知道你想要什么，等到最后只能是伤心和失望，尤其是感情。感谢老天爷所降下的雨水，为伤心淤积的心灵刷光洁净！靶谢我的双眼，再小、在咪、我也能看见日出日落、花开、花谢。不开心就睡一觉，就让他过去吧"],
                 [[AuthorModel alloc] initWithId:@4 name:@"搞笑男" headImage:head4],
                 [[ContentModel alloc] initWithContent:@"一个出色的男人必须色！！！"],
                 [[ImageModel alloc] initWithUrls:@[imageURL1, imageURL2]], nil];
    }
    return _data;
}

- (NSArray *)segments {
    if (!_segments) {
        _segments = @[@[@"All",@""],@[@"Images",NSStringFromClass([ImageModel class])],@[@"Text",NSStringFromClass([ContentModel class])],@[@"Users",NSStringFromClass([AuthorModel class])]];
    }
    return _segments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedClass = self.segments[0][1];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSArray *arr in self.segments) {
        [arrM addObject:arr.firstObject];
    }
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:arrM];
    control.selectedSegmentIndex = 0;
    [control addTarget:self action:@selector(onControl:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = control;
    
    [self.view addSubview:self.collectionView];
    //给adapter赋值collectionView
    self.adapter.collectionView = self.collectionView;
    //给adapter赋值dataSource
    self.adapter.dataSource = self;
}
 
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame=self.view.bounds;
}

- (void)onControl:(UISegmentedControl *)control {
    self.selectedClass = self.segments[control.selectedSegmentIndex][1];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

// MARK: IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    if ([self.selectedClass isEqualToString:self.segments[0][1]]) {
        return self.data;
    }
    
    NSMutableArray *arrM = [NSMutableArray array];
    Class class = NSClassFromString(self.selectedClass);
    for (id obj in self.data) {
        if ([obj isKindOfClass:class]) {
            [arrM addObject:obj];
        }
    }
    return arrM;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[ContentModel class]]) {
        return [ContentSectionController new];
    } else if ([object isKindOfClass:[ImageModel class]]) {
        return [ImageSectionController new];
    } else {
        return [AuthorSectionController new];
    }
}

-(UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
