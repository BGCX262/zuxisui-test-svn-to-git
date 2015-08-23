//
//  pockerGroup.h
//  pocker_forTest
//
//  Created by Sui Seedorf on 12-7-8.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PockerGroup : NSObject {
	int  oneNum;
	NSMutableString *oneType;
	int  twoNum;
	NSMutableString *twoType;
	int  threeNum;
	NSMutableString *threeType;

}
@property(nonatomic) int oneNum;
@property(nonatomic,retain) NSString *oneType;
@property(nonatomic) int twoNum;
@property(nonatomic,retain) NSString *twoType;
@property(nonatomic) int threeNum;
@property(nonatomic,retain) NSString *threeType;

@end
