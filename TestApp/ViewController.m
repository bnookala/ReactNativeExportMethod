//
//  ViewController.m
//  TestApp
//
//  Created by Bhargav Nookala on 8/26/15.
//  Copyright (c) 2015 Bhargav Nookala. All rights reserved.
//


#import "ViewController.h"
#import "MyReactView.h"
#import "ReactViewCloser.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *myButton;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.reactView];
    [self.view addSubview:self.myButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (ReactView *)reactView {
    if (_reactView == nil) {
        _reactView = [[ReactView alloc] initWithFrame:CGRectMake(0, 10, 320, 480)];
       [(ReactViewCloser *)_reactView.rootView.bridge.modules[@"MyModule"] setViewController:self];
    }

    return _reactView;
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
    self.reactView.hidden = !self.reactView.isHidden;
}

@end