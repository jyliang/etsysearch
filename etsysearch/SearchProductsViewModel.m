//
//  SearchProductsViewModel.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "SearchProductsViewModel.h"
#import "ProductItemViewModel.h"

#define kURLApiBase @"https://api.etsy.com/v2/"
#define kURLApiKey @"liwecjs0c3ssk6let4p1wqt9"

static NSString * const kPagination = @"pagination";
static NSString * const kResults = @"results";
static NSString * const kCount = @"count";

static NSString * const kPaginationOffset = @"effective_offset";

@interface SearchProductsViewModel ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SearchProductsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
        self.products = [NSMutableArray array];
    }
    return self;
}

- (void)populateEmptyViewModelForOffset:(NSInteger)offset withLimit:(NSInteger)limit {
    if (self.products.count == offset) {
        //perfect match
        NSMutableArray *products = [NSMutableArray array];
        for (int i = 0; i < limit; i++) {
            ProductItemViewModel *itemVM = [ProductItemViewModel getEmptyItemViewModel];
            [products addObject:itemVM];
        }
        [self.products addObjectsFromArray:products];
    } else if (self.products.count < offset) {
        NSMutableArray *products = [NSMutableArray array];
        for (int i = 0; i < limit+offset-self.products.count; i++) {
            ProductItemViewModel *itemVM = [ProductItemViewModel getEmptyItemViewModel];
            [products addObject:itemVM];
        }
        [self.products addObjectsFromArray:products];
    }
}

- (void)loadMoreProductsForOffset:(NSInteger)offset withLimit:(NSInteger)limit {
    [self populateEmptyViewModelForOffset:offset withLimit:limit];
    [self.delegate reloadProductData];

    NSString *urlString = [[NSString stringWithFormat:@"%@listings/active?api_key=%@&includes=MainImage&offset=%li&limit=%li&keywords=%@", kURLApiBase, kURLApiKey, offset, limit,self.searchKeyword] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *pagination = responseObject[kPagination];
        NSInteger offset = [pagination[kPaginationOffset] integerValue];
        NSArray *results = responseObject[kResults];
        for (NSDictionary *dictionary in results) {
            [self.products[offset] populateWithJSON:dictionary];
            offset++;
        }
        [self.delegate reloadProductData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error %@", [error localizedDescription]);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

- (void)loadMoreProductsToIndex:(NSInteger)index {
    
}

@end
