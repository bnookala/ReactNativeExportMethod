//
//  ReactViewCloser.h
//  TestApp
//
//  Created by Dave Sibiski on 8/27/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RCTBridgeModule.h"
#import "ViewController.h"

@interface ReactViewCloser : NSObject <RCTBridgeModule>

@property (nonatomic, strong) ViewController *viewController;

@end
