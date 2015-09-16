#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RCTRootView.h"


@protocol ReactViewDelegate <NSObject>

+ (NSString *) jsFileName;
+ (NSString *) jsModuleName;
+ (NSURL *) jsBundleLocation;

@end

@interface ReactView : UIView <ReactViewDelegate>

@property (nonatomic, strong) RCTRootView *rootView;

/**
 * Wrapper to instantiate a view and bind it to its proper bridge. A bridge is useful for callbacks into native objective c code, and for accessing
 * existing modules.
 *
 * @param frame The frame of the view.
 * @param controller The view controller of the react bridge.
 * @param bridgeModule The name of the bridge module.
 */
- (instancetype)initWithFrame:(CGRect)frame
               viewController:(UIViewController *)controller
                 bridgeModule:(NSString *)bridgeModule;

@end