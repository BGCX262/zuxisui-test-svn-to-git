
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIViewPassValueDelegate.h"
@interface pocker_forTestViewController : UIViewController <UIViewPassValueDelegate> {
	UIButton *imgv;
	NSMutableArray *array;
	NSMutableArray *okArray;
	NSMutableArray *noArray;
}
@property(nonatomic,retain)UIButton *imgv;
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSMutableArray *okArray;
@property(nonatomic,retain)NSMutableArray *noArray;
@property(nonatomic, retain) IBOutlet UITextField *value;
- (IBAction)buttonClick:(id)sender;

-(IBAction)postCards;
-(IBAction)jiequNineCards;
-(IBAction)passCard;
-(IBAction)lookOk;
-(IBAction)lookNo;
@end

