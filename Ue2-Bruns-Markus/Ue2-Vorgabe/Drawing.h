//
//  Drawing.h
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Drawing <NSObject>

- (void)paint;				// draw item
- (double)area;				// return area of item
- (double)circumference;	// return circumference of item

@end
