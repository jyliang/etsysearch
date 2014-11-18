//
//  ProductTableViewCell.m
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation ProductTableViewCell

- (void)prepareForReuse {
    [self.productImageView setImage:nil];
    [self.productImageView setImageWithURL:nil];
    self.productTitleLabel.text = @"";
}

- (void)populateWithProductItemVM:(ProductItemViewModel *)itemVM {
    if (itemVM.populated) {
        self.productTitleLabel.text = [itemVM getProductTitle];
        [self.productImageView setImageWithURL:[NSURL URLWithString:[itemVM getProductImageURL]] placeholderImage:[UIImage imageNamed:@"icon"]];
    } else {
        [self.productImageView setImage:[UIImage imageNamed:@"icon"]];
        self.productTitleLabel.text = @"loading...";
    }
}

@end
