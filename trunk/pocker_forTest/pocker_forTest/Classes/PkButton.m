//
//  PkButton.h
//  pocker_forTest
//
//  Created by Sui Seedorf on 12-6-28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "PkButton.h"
@implementation PkButton
@synthesize pkType;
@synthesize pkNum;
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/
/*
-(void) drawRect:(CGRect)rect {
    
    [ self.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [ self.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [ self.layer setBorderWidth: 1.0];
    [ self.layer setCornerRadius:8.0f];
    [ self.layer setMasksToBounds:YES];
}*/
- (void)dealloc {
    [super dealloc];
}


@end
