//
//  FirstViewController.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "FirstViewController.h"
#import "SearchManager.h"
#import "ProductTableViewCell.h"

#define kSizeCellHeight 75
#define kLoadMoreThreshold 100

@interface FirstViewController () <UISearchBarDelegate, SearchProductsViewModelDelegate>

@property (nonatomic, strong) SearchManager *searchMgr;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchMgr = [[SearchManager alloc] init];
    [self.searchBar becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SearchProductsViewModel *)currentSearchProductsVM {
    return [self.searchMgr getCurrentSearchProductsViewModel];
}

- (void)loadMoreForCurrentProductsViewModel {
    [[self currentSearchProductsVM] loadMoreProductsForOffset:[self currentSearchProductsVM].products.count withLimit:kDefaultLimit];
}

#pragma mark - UITableViewCell DataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self currentSearchProductsVM].products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([ProductTableViewCell class]) forIndexPath:indexPath];
    ProductItemViewModel *productVM = [self currentSearchProductsVM].products[indexPath.item];
    [cell populateWithProductItemVM:productVM];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSizeCellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self scrollViewReachedThreshold:scrollView]) {
        SearchProductsViewModel *vm = [self currentSearchProductsVM];
        [vm loadMoreProductsForOffset:vm.products.count withLimit:kDefaultLimit];
    }
}

- (BOOL)scrollViewReachedThreshold:(UIScrollView *)scrollView {
    CGFloat threshold = [self currentSearchProductsVM].products.count * kSizeCellHeight - CGRectGetHeight(scrollView.frame)-scrollView.contentOffset.y;
    return threshold < kLoadMoreThreshold;
}

#pragma mark - Search Bar 

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //trim trailing spaces
    SearchProductsViewModel *vm = [self currentSearchProductsVM];
    vm.delegate = nil;
    [self.searchMgr setCurrentSearchKey:searchBar.text];
    vm = [self currentSearchProductsVM];
    vm.delegate = self;
    [self.tableView setContentOffset:CGPointZero];
    [self.tableView reloadData];
    if (vm.products.count == 0) {
        [vm loadMoreProductsForOffset:0 withLimit:kDefaultLimit];
    }
    [searchBar resignFirstResponder];
}

#pragma mark - SearchProductsViewModelDelegate

- (void)reloadProductData {
    [self.tableView reloadData];
}

@end
