//
//  IOHelper.m
//  Ue3-Vorgabe
//
//  Created by Klaus Jung on 31.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "IOHelper.h"

#define MAX_LINE_LENGHT 200

@implementation IOHelper

+ (void)printLineWithFormat:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    NSString *line = [[NSString alloc] initWithFormat:format arguments:args];
	printf("%s\n", [line UTF8String]);
	[line release];
    va_end(args);
}

+ (NSString*)readLine {
	char line[MAX_LINE_LENGHT];
	fgets(line, MAX_LINE_LENGHT, stdin);
	size_t len = strlen(line);
	if(len > 0 && line[len-1] == '\n') line[len-1] = '\0';
	return [NSString stringWithUTF8String:line];
}

+ (NSString*)readLineWithMessage:(NSString*)message {
	printf("%s ", [message UTF8String]);
    return [self readLine];
}

+ (NSNumber*)readIntegerNumberWithMessage:(NSString*)message {
    NSString *line = [self readLineWithMessage:message];
    return [NSNumber numberWithInteger:[line integerValue]];
}

+ (char)prompt:(NSString*)message {
    printf("%s ", [message UTF8String]);
    char line[MAX_LINE_LENGHT];
    fgets(line, MAX_LINE_LENGHT, stdin);
    return tolower(line[0]);
}



@end
