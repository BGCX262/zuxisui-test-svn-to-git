//
//  ValueInputView.m
//  pocker_forTest
//
//  Created by Sui Seedorf on 12-7-8.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ValueInputView.h"


@implementation ValueInputView
@synthesize delegate;
@synthesize value;
- (void)dealloc {
	[self.value release];
	[super dealloc];
}

- (IBAction)buttonClick:(id)sender
{
	//NSLog(@" INPUT VALUE===%@",self.value.text);
	[delegate passValue:self.value.text]; // 具体的实现在第一个VC里。
	//NSLog(@"self.value.text is%@", self.value.text);
	[self dismissModalViewControllerAnimated:YES];    
    
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
