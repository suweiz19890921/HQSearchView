//
//  HQSearchView.h
//  HQSearchViewDemo
//
//  Created by 刘欢庆 on 2017/5/5.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HQSearchView;
@protocol HQSearchViewDelegate <NSObject>
@optional
- (void)searchViewWillAppear:(HQSearchView *)searchView;
- (void)searchViewWillDisappear:(HQSearchView *)searchView;

@end


@interface HQSearchView : UIView
@property (nonatomic, weak) id<HQSearchViewDelegate> delegate;

/** 搜索占位文字 */
@property (nonatomic, strong) NSString *placeholder;

/** 搜索结果的视图,可以替换为自己定制的 */
@property (weak, nonatomic) UITableView *tableView;

/** 显示 */
- (void)showInView:(UIView *)view;

/** 移除 */
- (void)remove;
@end
