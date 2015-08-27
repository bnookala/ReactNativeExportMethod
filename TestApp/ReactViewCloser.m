//
//  ReactViewCloser.m
//  TestApp
//
//  Created by Dave Sibiski on 8/27/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//

#import "ReactViewCloser.h"

@implementation ReactViewCloser

RCT_EXPORT_MODULE(MyModule);

RCT_EXPORT_METHOD(dismissView){
    NSLog(@"Hiding the react view via react native control.");
    [(ViewController *)self.viewController reactView].hidden = YES;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

@end
