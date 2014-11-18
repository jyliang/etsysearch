//
//  SearchManager.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "SearchManager.h"

@implementation SearchManager

- (SearchProductsViewModel *)getCurrentSearchProductsViewModel {
    if (self.currentSearchKey.length > 0) {
        SearchProductsViewModel *vm = self.productsVMDictionary[self.currentSearchKey];
        if (vm == nil) {
            vm = [[SearchProductsViewModel alloc] init];
            vm.searchKeyword = self.currentSearchKey;
        }
        return vm;
    }
    return nil;
}

@end
