//
//  ReactBridge.m
//  TestApp
//
//  Created by Bhargav Nookala on 9/16/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//

#import "ReactBridge.h"

@implementation ReactBridge

RCT_EXPORT_MODULE();

+ (NSString *) bridgeName {
    return @"Implement me in your subclass.";
}

@end
