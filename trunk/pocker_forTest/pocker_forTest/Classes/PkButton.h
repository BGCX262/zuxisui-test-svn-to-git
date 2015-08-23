//
//  PkButton.h
//  pocker_forTest
//
//  Created by Sui Seedorf on 12-6-28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PkButton : UIButton {
		int  pkNum;
	NSMutableString *pkType;

}
@property(nonatomic,retain) NSMutableString *pkType;
@property(nonatomic) int pkNum;
@end
