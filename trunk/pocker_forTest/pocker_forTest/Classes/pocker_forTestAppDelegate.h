

#import <UIKit/UIKit.h>

@class pocker_forTestViewController;

@interface pocker_forTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    pocker_forTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet pocker_forTestViewController *viewController;

@end

