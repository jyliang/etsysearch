//
//  MainImage.m
//  etsysearch
//
//  Created by Jason Liang on 11/18/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "MainImage.h"

static NSString * const kURL75x75 = @"url_75x75";

@implementation MainImage

- (instancetype)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        self.url_75x75 = json[kURL75x75];
    }
    return self;
}

@end
