//
//  ProductItemViewModel.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "ProductItemViewModel.h"
#import "MainImage.h"

static NSString * const kTitle = @"title";
static NSString * const kMainImage = @"MainImage";


@interface ProductItemViewModel ()

@property (nonatomic, strong) NSString *productTitle;
@property (nonatomic, strong) MainImage *mainImage;

@end

@implementation ProductItemViewModel

+ (ProductItemViewModel *)getEmptyItemViewModel {
    ProductItemViewModel *vm = [[ProductItemViewModel alloc] init];
    vm.populated = NO;
    return vm;

}

- (void)populateWithJSON:(NSDictionary *)json {
    self.populated = YES;
    self.productTitle = json[kTitle];
    if ([ValidationUtility isValidDictionary:json[kMainImage]]) {
        self.mainImage = [[MainImage alloc] initWithJSON:json[kMainImage]];
    }
}

- (NSString *)getProductTitle {
    return self.productTitle;
}

- (NSString *)getProductImageURL {
    return self.mainImage.url_75x75;
}

@end
