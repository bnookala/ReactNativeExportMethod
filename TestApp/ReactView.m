#import "ReactView.h"
#import "ReactBridge.h"


@interface ReactView ()

@end


@implementation ReactView

#pragma mark ReactViewDelegate

+ (NSString *)jsFileName {
    return @"";
}

+ (NSString *)jsModuleName {
    return @"";
}

+ (NSString *)javaScriptHost {
    return @"localhost";
}

+ (NSNumber *)javaScriptPort {
    return @8081;
}

+ (NSString *)jsPath {
    return [NSString stringWithFormat:@"/%@.ios.bundle", [[self class] jsFileName]];
}

- (BOOL)isServerRunning {
    NSURLComponents *url = [[NSURLComponents alloc] init];
    url.scheme = @"http";
    url.host = [[self class] javaScriptHost];
    url.port = [[self class] javaScriptPort];
    url.path = @"";

    NSURLRequest *request = [NSURLRequest requestWithURL:url.URL];
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    if (error) {
        return NO;
    }

    return YES;
}

+ (NSURL *)jsHttpCodeLocation {
    NSURLComponents *jsUrl = [[NSURLComponents alloc] init];

    jsUrl.scheme = @"http";
    jsUrl.host = [self javaScriptHost];
    jsUrl.port = [self javaScriptPort];
    jsUrl.path = [self jsPath];

    return jsUrl.URL;
}

+ (NSURL *)jsBundleLocation {
    return [[NSBundle mainBundle] URLForResource:[self jsFileName] withExtension:@"jsbundle"];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSURL *jsCodeLocation;

#ifdef DEBUG
        if ([self isServerRunning]) {
            jsCodeLocation = [[self class] jsHttpCodeLocation];
        } else {
            jsCodeLocation = [[self class] jsBundleLocation];
        }
#else
        // Use the bundle file in production.
        jsCodeLocation = [[self class] jsBundleLocation];
#endif

#ifdef UNIT_TESTING
        // Use the bundle file in unit/integration testing.
        jsCodeLocation = [[self class] jsBundleLocation];
#endif

        self.rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                    moduleName:[[self class] jsModuleName]
                                                 launchOptions:nil];

        self.rootView.backgroundColor = [UIColor clearColor];
        self.rootView.frame = frame;
        [self addSubview:self.rootView];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
               viewController:(UIViewController *)controller
                 bridgeModule:(NSString *)bridgeModule {

    if (self = [self initWithFrame:frame]) {
        ((ReactBridge *)self.rootView.bridge.modules[bridgeModule]).viewController = controller;
    }

    return self;
}

@end