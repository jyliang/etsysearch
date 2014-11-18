//
//  ProductItemViewModel.h
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductItemViewModel : NSObject

@property (nonatomic) BOOL populated;

+ (ProductItemViewModel *)getEmptyItemViewModel;
- (void)populateWithJSON:(NSDictionary *)json;

- (NSString *)getProductTitle;
- (NSString *)getProductImageURL;

@end
