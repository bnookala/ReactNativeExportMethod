#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RCTRootView.h"


@protocol ReactViewDelegate <NSObject>

+ (NSString *) jsFileName;
+ (NSString *) jsModuleName;
+ (NSURL *) jsBundleLocation;

@end


@interface ReactView : UIView <ReactViewDelegate>

@end