//
//  MainImage.h
//  etsysearch
//
//  Created by Jason Liang on 11/18/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainImage : NSObject

@property (nonatomic, strong) NSString *url_75x75;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
