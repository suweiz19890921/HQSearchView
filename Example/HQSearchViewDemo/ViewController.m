//
//  ViewController.m
//  HQSearchViewDemo
//
//  Created by 刘欢庆 on 2017/5/5.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "ViewController.h"
#import "HQSearchView.h"
@interface ViewController ()<HQSearchViewDelegate>
@property (nonatomic, strong) HQSearchView *searchView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)showSearchView:(id)sender
{
    [self.searchView showInView:self.view];
}


- (HQSearchView *)searchView
{
    if(!_searchView)
    {
        HQSearchView *searchView = [[HQSearchView alloc] initWithFrame:self.view.bounds];
        searchView.delegate = self;
        _searchView = searchView;
        return searchView;
    }
    return _searchView;
}

#pragma mark - HQSearchViewDelegate
- (void)searchView:(HQSearchView *)searchView textDidChange:(NSString *)searchText
{
    NSLog(@"searchText %@",searchText);
}

@end
