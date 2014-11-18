//
//  SearchProductsViewModel.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "SearchProductsViewModel.h"

#define kURLApiBase @"https://api.etsy.com/v2/"
#define kURLApiKey @"liwecjs0c3ssk6let4p1wqt9"

@interface SearchProductsViewModel ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SearchProductsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)loadMoreProducts {
    NSString *urlString = [NSString stringWithFormat:@"%@listings/active?api_key=%@&includes=MainImage&keywords=%@", kURLApiBase, kURLApiKey, self.searchKeyword];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];

}

- (void)loadMoreProductsToIndex:(NSInteger)index {
    
}

@end
