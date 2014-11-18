//
//  SearchProductsViewModel.h
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSInteger const kDefaultLimit = 25;

@protocol SearchProductsViewModelDelegate <NSObject>

- (void)reloadProductData;

@end

@interface SearchProductsViewModel : NSObject

@property (nonatomic, weak) id<SearchProductsViewModelDelegate> delegate;
@property (nonatomic, strong) NSString *searchKeyword;
@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic) NSInteger maxCount;

- (void)loadMoreProductsForOffset:(NSInteger)offset withLimit:(NSInteger)limit;
- (void)loadMoreProductsToIndex:(NSInteger)index;

@end
