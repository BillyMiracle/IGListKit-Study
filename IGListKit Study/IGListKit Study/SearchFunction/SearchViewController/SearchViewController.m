//
//  SearchViewController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "SearchViewController.h"
#import "LabelSectionController.h"

@interface SearchViewController ()<IGListAdapterDataSource>
@property (strong, nonatomic) IGListAdapter *adapter;
@property (strong, nonatomic) NSMutableArray *words;
@property (strong, nonatomic) NSString *filterString;
@property (strong, nonatomic) IGListCollectionView *collectionView;
@property (strong, nonatomic) NSNumber *searchToken;
@end

@implementation SearchViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (IGListCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero listCollectionViewLayout:[[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:NO]];
    }
    return _collectionView;
}

- (NSMutableArray *)words {
    if (!_words) {
        _words = [NSMutableArray arrayWithObjects:@"喜茶", @"Carry", @"MyLove", @"一碗", @"疯狂星期四", @"哦吼", @"嘿嘿嘿", @"肯德基", @"麦当当", @"小顶", @"SAMSUNG", @"Honda", @"Toyota", @"Mustang", @"Ford", @"iOSClub", @"MacBook", @"Air", @"华为", @"罗技", @"话说你是谁", @"磁吸无线充电宝", @"输入", @"高级编程", @"operation", @"巴巴罗萨行动", @"DELL", @"飞利浦", nil];
    }
    return _words;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchToken = @42;
    self.filterString = @"";
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = _collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
}

// MARK: IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *arrM = [NSMutableArray arrayWithObject:_searchToken];
    if ([self.filterString isEqualToString:@""]) {
        [arrM addObjectsFromArray:self.words];
    } else {
        for (NSString *str in self.words) {
            if ([str.lowercaseString containsString:_filterString.lowercaseString]) {
                [arrM addObject:str];
            }
        }
    }
    return arrM;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    NSNumber *obj = object;
    if (obj == _searchToken) {
        SearchSectionController *sectionController = [[SearchSectionController alloc] init];
        sectionController.delegate = self;
        return sectionController;
    }
    
    return [LabelSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

// MARK: SearchSectionControllerDelegate
- (void)searchSectionController:(SearchSectionController *)sectionController didChangeText:(NSString *)text {
    self.filterString = text;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

@end
