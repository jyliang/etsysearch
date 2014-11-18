//
//  SearchManager.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "SearchManager.h"
#import "NSString+Addtions.h"

@implementation SearchManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.productsVMDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setCurrentSearchKey:(NSString *)currentSearchKey {
    NSString *searchKey = [[currentSearchKey lowercaseString] stringByTrimmingLeadingAndTrailingWhitespaceAndNewlineCharacters];
    _currentSearchKey = searchKey;
}

- (SearchProductsViewModel *)getCurrentSearchProductsViewModel {
    if (self.currentSearchKey.length > 0) {
        SearchProductsViewModel *vm = self.productsVMDictionary[self.currentSearchKey];
        if (vm == nil) {
            vm = [[SearchProductsViewModel alloc] init];
            vm.searchKeyword = self.currentSearchKey;
            self.productsVMDictionary[self.currentSearchKey] = vm;
        }
        return vm;
    }
    return nil;
}



@end
