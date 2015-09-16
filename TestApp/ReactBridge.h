//
//  ReactBridge.h
//  TestApp
//
//  Created by Bhargav Nookala on 9/16/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RCTBridgeModule.h"

@protocol ReactBridgeDelegate

+ (NSString *) bridgeName;

@end

@interface ReactBridge : NSObject <RCTBridgeModule, ReactBridgeDelegate>

/**
 * This is the view controller that the bridge module interacts with.
 */
@property (nonatomic, strong) UIViewController *viewController;

@end
