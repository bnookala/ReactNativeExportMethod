//
//  ViewController.m
//  TestApp
//
//  Created by Bhargav Nookala on 8/26/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//


#import "ViewController.h"
#import "MyReactView.h"


@interface ViewController ()

@property (nonatomic, strong) MyReactView *myReactView;
@property (nonatomic, strong) UIButton *myButton;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.myReactView];
    [self.view addSubview:self.myButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MyReactView *)myReactView {
    if (_myReactView == nil) {
        _myReactView = [[MyReactView alloc] initWithFrame:CGRectMake(0, 10, 320, 480)];
    }

    return _myReactView;
}

- (UIButton *)myButton {
    if (_myButton == nil) {
        _myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _myButton.frame = CGRectMake(0, 270, 320, 40);
        [_myButton setTitle:@"Hide the react view." forState:UIControlStateNormal];
        [_myButton addTarget:self action:@selector(dismissViaNativeControl) forControlEvents:UIControlEventTouchUpInside];
    }

    return _myButton;
}

- (void)dismissViaNativeControl {
    NSLog(@"Hiding the react view via native IOS control.");
    self.myReactView.hidden = !self.myReactView.isHidden;
}


RCT_EXPORT_MODULE(MyModule);

RCT_EXPORT_METHOD(dismissView){
    NSLog(@"Hiding the react view via react native control.");
    self.myReactView.hidden = YES;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}


@end