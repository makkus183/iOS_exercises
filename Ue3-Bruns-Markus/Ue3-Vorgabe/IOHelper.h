//
//  IOHelper.h
//  Ue3-Vorgabe
//
//  Created by Klaus Jung on 31.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOHelper : NSObject

// command line output
+ (void)printLineWithFormat:(NSString*)format, ...;

// command line input
+ (NSString*)readLine;
+ (NSString*)readLineWithMessage:(NSString*)message;
+ (NSNumber*)readIntegerNumberWithMessage:(NSString*)message;
+ (char)prompt:(NSString*)message;


@end
