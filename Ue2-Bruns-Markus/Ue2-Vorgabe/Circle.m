//
//  Circle.m
//  Ue2-Vorgabe
//
//  Created by Markus Bruns on 26.10.13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Circle.h"
#import "DrawHelper.h"
#import <math.h>

@implementation Circle

- (void) paint {
    [DrawHelper drawCircleAtX:middlePt.x y:middlePt.y size:size color:color];
    if (self.showDescription) {
        [DrawHelper drawDescriptionArea:self.area circumference:self.circumference atX:middlePt.x y:middlePt.y];
    }
    [DrawHelper drawGlyphIndex:index atX:middlePt.x y:middlePt.y];
}

- (double) area {
    return (M_PI * powf(size, 2)) / 4  ;
}

- (double) circumference {
    return 2 * M_PI * (size * 0.5);
}

@end
