//
//  ValueInputView.h
//  pocker_forTest
//
//  Created by Sui Seedorf on 12-7-8.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate.h"


@interface ValueInputView : UIViewController {
	NSObject<UIViewPassValueDelegate> * delegate;
	UITextField *value;
	
}
@property(nonatomic, retain)IBOutlet UITextField *value;
@property(nonatomic, retain) NSObject<UIViewPassValueDelegate> * delegate;

- (IBAction)buttonClick:(id)sender;


@end
