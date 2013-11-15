//
//  ViewController.m
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)positionChanched:(NSSet*)touches;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [typeIndex release];
    [colorIndex release];
    [size release];
    
    typeIndex = [@[ @0, @1, @2 ] mutableCopy];
    colorIndex = [@[ @2, @1, @0 ] mutableCopy];
    size = [@[ @35, @40, @50 ] mutableCopy];
    color = [@[[UIColor colorWithRed:1 green:0 blue:0 alpha:0.75f],
               [UIColor colorWithRed:0 green:1 blue:0 alpha:0.75f],
               [UIColor colorWithRed:0 green:0 blue:1 alpha:0.75f]] retain];
    
    int x[3] = { 50, 150, 250};
    int y[3] = { 200, 100, 150};
    
    for(int i = 0; i < 3; i++) {
        [_glyphView glyph:i changedType:[typeIndex[i] integerValue]];
        [_glyphView glyph:i changedColor:color[[colorIndex[i] integerValue]]];
        [_glyphView glyph:i changedSize:[size[i] floatValue]];
        [_glyphView glyph:i changedPositionX:x[i] positionY:y[i]];
    }
    
    [self glyphChanged:nil];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [_glyphView setNeedsDisplay];
}


- (void)dealloc
{
    [typeIndex release];
    [colorIndex release];
    [size release];
    [color release];
    [_glyphIndex release];
    [_glyphType release];
    [_glyphColor release];
    [_glyphSize release];
    [_glyphView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)glyphChanged:(id)sender {
    _glyphType.selectedSegmentIndex = [typeIndex[_glyphIndex.selectedSegmentIndex] integerValue];
    _glyphColor.selectedSegmentIndex = [colorIndex[_glyphIndex.selectedSegmentIndex] integerValue];
    _glyphSize.value = [size[_glyphIndex.selectedSegmentIndex] floatValue];
    [_glyphView setNeedsDisplay];
}

- (IBAction)typeChanged:(id)sender {
    typeIndex[_glyphIndex.selectedSegmentIndex] = [NSNumber numberWithInteger:_glyphType.selectedSegmentIndex];
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex changedType:_glyphType.selectedSegmentIndex];
    [_glyphView setNeedsDisplay];
}

- (IBAction)colorChanged:(id)sender {
    colorIndex[_glyphIndex.selectedSegmentIndex] = [NSNumber numberWithInteger:_glyphColor.selectedSegmentIndex];
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex changedColor:color[_glyphColor.selectedSegmentIndex]];
    [_glyphView setNeedsDisplay];
}

- (IBAction)sizeChanged:(id)sender {
    size[_glyphIndex.selectedSegmentIndex] = [NSNumber numberWithFloat:_glyphSize.value];
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex changedSize:_glyphSize.value];
    [_glyphView setNeedsDisplay];
}

- (IBAction)sizeChangeBegin:(id)sender {
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex showDescription:YES];
    [_glyphView setNeedsDisplay];
}

- (IBAction)sizeChangeEnd:(id)sender {
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex showDescription:NO];
    [_glyphView setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:_glyphView];
    [self setActiveGlyph:pos];
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex showDescription:YES];
    
    [self positionChanched:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self positionChanched:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex showDescription:NO];
    [self positionChanched:touches];
}

- (void)positionChanched:(NSSet*)touches {
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:_glyphView];
    [_glyphView glyph:_glyphIndex.selectedSegmentIndex changedPositionX:pos.x positionY:pos.y];
    [_glyphView setNeedsDisplay];
}

- (void)setActiveGlyph:(CGPoint)pos {
    NSLog(@"posx: %f, posy: %f", pos.x, pos.y);
    for(int i = 0; i < 3; i++) {
        NSMutableArray *arr =[_glyphView glyphs];
        Glyph *glyph = arr[i];
        PointXY *pt = glyph.middlePt;
        if((pos.x >= [pt x] - glyph.size / 2) && (pos.x <= [pt x] + glyph.size / 2 )) {
            if((pos.y >= [pt y] - glyph.size / 2) && (pos.y <= [pt y] + glyph.size / 2 )) {
                NSLog(@"hitted element %i in x and y pos", i);
                _glyphIndex.selectedSegmentIndex = i;
                [self glyphChanged:nil];
            } else {
                NSLog(@"hitted element %i only in x pos", i);
            }
        }else {
            NSLog(@"hitted an empty space");
        }
    }
    NSLog(@"Glyphbutton %i", [typeIndex[_glyphIndex.selectedSegmentIndex] integerValue]);
}


@end
