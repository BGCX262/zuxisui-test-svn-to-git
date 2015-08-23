//
//  PGToast.h
//  pocker_forTest
//
//  Created by Sui Seedorf on 12-7-5.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface PGToast : NSObject 

- (void)show;
+ (PGToast *)makeToast:(NSString *)text;

@end

