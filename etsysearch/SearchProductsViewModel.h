//
//  SearchProductsViewModel.h
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchProductsViewModelDelegate <NSObject>

- (void)reloadProductData;

@end

@interface SearchProductsViewModel : NSObject

@property (nonatomic, weak) id<SearchProductsViewModelDelegate> delegate;
@property (nonatomic, strong) NSString *searchKeyword;
@property (nonatomic, strong) NSMutableArray *products;

- (void)loadMoreProducts;
- (void)loadMoreProductsToIndex:(NSInteger)index;

@end
