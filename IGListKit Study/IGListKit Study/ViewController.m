//
//  ViewController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/25.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "MixViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
//    SearchViewController *searchViewController = [[SearchViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
//    nav.modalPresentationStyle = UIModalPresentationFullScreen;
//    nav.title = @"Search";
//
//    [self presentViewController:nav animated:NO completion:nil];
    MixViewController *mixViewController = [[MixViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mixViewController];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:NO completion:nil];
    
}

@end
