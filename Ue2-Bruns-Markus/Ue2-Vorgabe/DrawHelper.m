//
//  DrawHelper.m
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 19.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "DrawHelper.h"

@implementation DrawHelper


+ (void)drawSquareAtX:(CGFloat)x y:(CGFloat)y size:(CGFloat)size color:(UIColor*)color {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x-size/2, y-size/2, size, size)];
    [color setFill];
    [path fill];
}

+ (void)drawCircleAtX:(CGFloat)x y:(CGFloat)y size:(CGFloat)size color:(UIColor*)color {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x-size/2, y-size/2, size, size)];
    [color setFill];
    [path fill];
}

+ (void)drawTriangleAtX:(CGFloat)x y:(CGFloat)y size:(CGFloat)size color:(UIColor*)color {
    UIBezierPath *path = [UIBezierPath bezierPath];
    y -= 4;
    [path moveToPoint:CGPointMake(x, y-size/2)];
    [path addLineToPoint:CGPointMake(x+size/2, y+size/2)];
    [path addLineToPoint:CGPointMake(x-size/2, y+size/2)];
    [path closePath];
    [color setFill];
    [path fill];
}

+ (void)drawDescriptionArea:(double)a circumference:(double)c atX:(CGFloat)x y:(CGFloat)y {
    NSString *desc = [NSString stringWithFormat:@"%.1lf / %.1lf", a, c];
    [[UIColor blackColor] setFill];
    [desc drawInRect:CGRectMake(x-100, y, 200, 20) withFont:[UIFont fontWithName:@"Helvetica" size:10] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
}

+ (void)drawGlyphIndex:(int)index atX:(CGFloat)x y:(CGFloat)y {
    NSString *desc = [NSString stringWithFormat:@"%i", index+1];
    [[UIColor whiteColor] setFill];
    [desc drawInRect:CGRectMake(x-10, y-10, 20, 20) withFont:[UIFont fontWithName:@"Helvetica-Bold" size:18] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
}

@end
