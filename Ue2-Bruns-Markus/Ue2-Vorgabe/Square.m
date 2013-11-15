//
//  Square.m
//  Ue2-Vorgabe
//
//  Created by  on 23.10.13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Square.h"
#import "DrawHelper.h"

@implementation Square

- (void) paint {
    [DrawHelper drawSquareAtX:middlePt.x y:middlePt.y size:size color:color];
    if (self.showDescription) {
        [DrawHelper drawDescriptionArea:self.area circumference:self.circumference atX:middlePt.x y:middlePt.y];
    }
    [DrawHelper drawGlyphIndex:index atX:middlePt.x y:middlePt.y];
}

- (double) area {
    return size * size;
}

- (double) circumference {
    return size * 4;
}


@end
