//
//  ValidationUtility.h
//  etsysearch
//
//  Created by Jason Liang on 11/18/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidationUtility : NSObject

+ (BOOL)isValidArray:(NSObject*)object;
+ (BOOL)isValidDictionary:(NSObject*)object;
+ (BOOL)isValidNumber:(NSObject*)object;
+ (BOOL)isValidString:(NSObject*)object;
+ (BOOL)isValidLengthString:(NSObject*)object;

@end
