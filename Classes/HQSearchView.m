//
//  HQSearchView.m
//  HQSearchViewDemo
//
//  Created by 刘欢庆 on 2017/5/5.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "HQSearchView.h"
#define COLOR_WITH_HEX(HEX) [UIColor colorWithRed:((HEX & 0xFF0000) >> 16)/255.0 green:((HEX & 0xFF00) >> 8)/255.0 blue:(HEX & 0xFF)/255.0 alpha:1]

@interface HQSearchView()<UISearchBarDelegate>
@property (weak, nonatomic) UIView *searchBarBG;
@property (weak, nonatomic) UISearchBar *searchBar;
@property (weak, nonatomic) UIVisualEffectView *visualEfView;

@end

@implementation HQSearchView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.placeholder = @"搜索";
        self.backgroundColor = [UIColor clearColor];
        [self loadSubview];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.searchBar.frame = CGRectMake(0, 20, CGRectGetWidth(self.frame), 44);
    self.searchBarBG.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 64);
    self.tableView.frame = CGRectMake(0, 64, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame) - 64);
    self.visualEfView.frame = self.bounds;
}

- (void)loadSubview
{
    [self addSubview:self.visualEfView];
    [self addSubview:self.searchBarBG];
    [self addSubview:self.tableView];
    
    [self.searchBarBG addSubview:self.searchBar];
}

- (void)showInView:(UIView *)view
{
    if([self.delegate respondsToSelector:@selector(searchViewWillAppear:)])
    {
        [self.delegate searchViewWillAppear:self];
    }
    [self.searchBar becomeFirstResponder];
    [view addSubview:self];
}

- (void)remove
{
    if([self.delegate respondsToSelector:@selector(searchViewWillDisappear:)])
    {
        [self.delegate searchViewWillDisappear:self];
    }
    [self removeFromSuperview];
}

#pragma mark - Action


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self remove];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}


#pragma mark - UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self remove];
}



#pragma mark - setter

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.searchBar.placeholder = placeholder;
}

#pragma mark - getter
- (UIView *)searchBarBG
{
    if(!_searchBarBG)
    {
        UIView *searchBarBG = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 64)];
        searchBarBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        searchBarBG.backgroundColor = COLOR_WITH_HEX(0xf0eff5);
        _searchBarBG = searchBarBG;
        return searchBarBG;
    }
    return _searchBarBG;
}

- (UISearchBar *)searchBar
{
    if(!_searchBar)
    {
        UISearchBar *searchBar      = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.frame), 44)];
        searchBar.delegate          = self;
        searchBar.showsCancelButton = YES;
        searchBar.autoresizingMask  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        searchBar.placeholder       = self.placeholder;
        searchBar.backgroundColor   = COLOR_WITH_HEX(0xf0eff5);
        searchBar.barTintColor      = COLOR_WITH_HEX(0xf0eff5);
        searchBar.layer.borderColor = COLOR_WITH_HEX(0xf0eff5).CGColor;
        searchBar.layer.borderWidth = 1.0f;
        searchBar.tintColor         = COLOR_WITH_HEX(0xff7116);
        
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil]
         setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:COLOR_WITH_HEX(0xff7116),NSForegroundColorAttributeName,nil]
         forState:UIControlStateNormal];
        _searchBar = searchBar;
        return searchBar;
    }
    return _searchBar;
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame) - 64) style:UITableViewStylePlain];
        tableView.hidden = YES;
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView = tableView;
        return tableView;
    }
    return _tableView;
}

- (UIVisualEffectView *)visualEfView
{
    if(!_visualEfView)
    {
        UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _visualEfView = visualEfView;
        return visualEfView;
    }
    return _visualEfView;
}

@end
