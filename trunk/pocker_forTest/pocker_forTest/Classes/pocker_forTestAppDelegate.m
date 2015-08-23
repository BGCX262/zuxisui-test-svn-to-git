

#import "pocker_forTestAppDelegate.h"
#import "pocker_forTestViewController.h"

@implementation pocker_forTestAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
  //  [window addSubview:viewController.view];
   // [window makeKeyAndVisible];
	
	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[pocker_forTestViewController alloc] init]];
	[window addSubview:nav.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
