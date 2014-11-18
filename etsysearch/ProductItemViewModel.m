//
//  ProductItemViewModel.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "ProductItemViewModel.h"

@interface ProductItemViewModel ()

@property (nonatomic, strong) NSString *productTitle;
@property (nonatomic, strong) NSString *productImageURL;

@end

@implementation ProductItemViewModel

- (NSString *)getProductTitle {
    return self.productTitle;
}

- (NSString *)getProductImageURL {
    return self.productImageURL;
}

@end
