//
//  SearchManager.h
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProductsViewModel.h"

@interface SearchManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *productsVMDictionary;
@property (nonatomic, strong) NSString *currentSearchKey;

- (SearchProductsViewModel *)getCurrentSearchProductsViewModel;

@end
