//
//  GlyphView.h
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Glyph.h"

@interface GlyphView : UIView {
    NSMutableArray *glyphs;
}

@property(retain) NSMutableArray *glyphs;

- (void)glyph:(int)index changedPositionX:(CGFloat)x positionY:(CGFloat)y;
- (void)glyph:(int)index changedType:(int)typeIndex;
- (void)glyph:(int)index changedColor:(UIColor*)color;
- (void)glyph:(int)index changedSize:(CGFloat)size;
- (void)glyph:(int)index showDescription:(BOOL)show;

@end
