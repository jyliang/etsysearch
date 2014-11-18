//
//  ProductTableViewCell.h
//  etsysearch
//
//  Created by Jason Liang on 11/17/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductItemViewModel.h"

@interface ProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;

- (void)populateWithProductItemVM:(ProductItemViewModel *)itemVM;

@end
