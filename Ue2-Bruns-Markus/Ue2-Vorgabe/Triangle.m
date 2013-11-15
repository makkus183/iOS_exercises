//
//  Triangle.m
//  Ue2-Vorgabe
//
//  Created by Markus Bruns on 26.10.13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Triangle.h"
#import "DrawHelper.h"

@implementation Triangle

- (void) paint {
    [DrawHelper drawTriangleAtX:middlePt.x y:middlePt.y size:size color:color];
    if (self.showDescription) {
        [DrawHelper drawDescriptionArea:self.area circumference:self.circumference atX:middlePt.x y:middlePt.y];
    }
    [DrawHelper drawGlyphIndex:index atX:middlePt.x y:middlePt.y];
}

- (double) area {
    return 0.5 * size * size;
}

- (double) circumference {
    CGFloat hypot = sqrtf(powf(size * 0.5, 2) + powf(size, 2));
    return 2 * hypot + size;
}


@end
