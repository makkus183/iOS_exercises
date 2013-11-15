//
//  GlyphView.m
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "GlyphView.h"
#import "Square.h"
#import "Triangle.h"
#import "Circle.h"



@implementation GlyphView


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        glyphs = [self createGlyphsArrayWithSize:3];
     }
    return self;
}

@synthesize glyphs;


#pragma mark Change Handlers

- (void)glyph:(int)index changedPositionX:(CGFloat)x positionY:(CGFloat)y {

    Glyph *glyph = [glyphs objectAtIndex:index];
    PointXY *pt = [[PointXY alloc] init];
    [pt setX:x];
    [pt setY:y];
//    why is this not working?
//    [glyph.middlePt setX:x];
//    [glyph.middlePt setY:y];
    glyph.middlePt = pt;
    [pt autorelease];
}

- (void)glyph:(int)index changedType:(int)typeIndex {
    Glyph *changedGlyph = nil;
    switch (typeIndex) {
        case 0:
            changedGlyph = [[Square alloc] init];
            break;
        case 1:
            changedGlyph = [[Circle alloc] init];
            break;
        case 2:
            changedGlyph = [[Triangle alloc] init];
            break;
        default:
            changedGlyph = [[Square alloc] init];
            break;
    }
    Glyph *storedSettingsGlyph = [glyphs objectAtIndex:index];
    changedGlyph.color = storedSettingsGlyph.color;
    changedGlyph.size = storedSettingsGlyph.size;
    changedGlyph.middlePt = storedSettingsGlyph.middlePt;
    changedGlyph.showDescription = storedSettingsGlyph.showDescription;
    changedGlyph.index = index;
    [glyphs replaceObjectAtIndex:index withObject:changedGlyph];
    [changedGlyph release];
}

- (void)glyph:(int)index changedColor:(UIColor*)color {
    Glyph *glyph = [glyphs objectAtIndex:index ];
    glyph.color = color;
}

- (void)glyph:(int)index changedSize:(CGFloat)size {
    Glyph *glyph = [glyphs objectAtIndex:index];
    glyph.size = size;

}

- (void)glyph:(int)index showDescription:(BOOL)show {
    Glyph *glyph = [glyphs objectAtIndex:index];
    glyph.showDescription = show;
}

- (NSMutableArray *)createGlyphsArrayWithSize:(int)amountOfGlyphs {
    if (!glyphs) {
        glyphs = [[NSMutableArray alloc] init];
        Glyph *glyph = [[Glyph alloc] init];
        for (int i = 0; i < amountOfGlyphs; i++) {
            glyph.index = i + 1;
            [glyphs addObject:glyph];
        }
        [glyph release];
    }
    return glyphs;
}


#pragma mark Drawing

- (void)drawRect:(CGRect)rect {
    for (int i = 0; i < [glyphs count]; i++) {
        Glyph *glyphToPaint = [glyphs objectAtIndex:i];
        [glyphToPaint paint];
    }
}


@end
