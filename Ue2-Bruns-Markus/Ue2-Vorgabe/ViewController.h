//
//  ViewController.h
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GlyphView.h"

@interface ViewController : UIViewController {
    NSMutableArray *typeIndex;
    NSMutableArray *colorIndex;
    NSMutableArray *size;
    NSArray *color;
}

@property (retain, nonatomic) IBOutlet UISegmentedControl *glyphIndex;
@property (retain, nonatomic) IBOutlet UISegmentedControl *glyphType;
@property (retain, nonatomic) IBOutlet UISegmentedControl *glyphColor;
@property (retain, nonatomic) IBOutlet UISlider *glyphSize;
@property (retain, nonatomic) IBOutlet GlyphView *glyphView;

- (IBAction)glyphChanged:(id)sender;
- (IBAction)typeChanged:(id)sender;
- (IBAction)colorChanged:(id)sender;
- (IBAction)sizeChanged:(id)sender;
- (IBAction)sizeChangeBegin:(id)sender;
- (IBAction)sizeChangeEnd:(id)sender;

@end
