//
//  Glyph.h
//  Ue2-Vorgabe
//
//  Created by  on 23.10.13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drawing.h"
#import "PointXY.h"

@interface Glyph : NSObject <Drawing>
{
    PointXY *middlePt;
    UIColor *color;
    CGFloat size;
    BOOL showDescription;
    int index;
}

@property(retain) PointXY *middlePt;
@property(retain) UIColor *color;
@property CGFloat size;
@property BOOL showDescription;
@property int index;

@end
