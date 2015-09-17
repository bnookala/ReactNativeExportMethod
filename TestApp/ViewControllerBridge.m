//
//  ViewControllerBridge.m
//  TestApp
//
//  Created by Bhargav Nookala on 9/16/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//
#import "ViewController.h"
#import "ViewControllerBridge.h"

@implementation ViewControllerBridge

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(dismissView){
    [(ViewController *) self.viewController reactView].hidden = YES;
}

# pragma mark RCTBridgeModule

- (dispatch_queue_t) methodQueue {
    return dispatch_get_main_queue();
};

# pragma mark ReactBridgeDelegate

+ (NSString *) bridgeName {
    return NSStringFromClass([ViewControllerBridge class]);
}


@end
