//
//  DrawHelper.h
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 19.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawHelper : NSObject

+ (void)drawSquareAtX:(CGFloat)x y:(CGFloat)y size:(CGFloat)size color:(UIColor*)color;
+ (void)drawCircleAtX:(CGFloat)x y:(CGFloat)y size:(CGFloat)size color:(UIColor*)color;
+ (void)drawTriangleAtX:(CGFloat)x y:(CGFloat)y size:(CGFloat)size color:(UIColor*)color;
+ (void)drawDescriptionArea:(double)a circumference:(double)c atX:(CGFloat)x y:(CGFloat)y;
+ (void)drawGlyphIndex:(int)index atX:(CGFloat)x y:(CGFloat)y;

@end
