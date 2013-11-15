//
//  main.m
//  Ue3-Vorgabe
//
//  Created by Klaus Jung on 31.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookController.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BookController *cont = [[BookController alloc] init];
        
        [cont run];
        
        [cont release];
        
    }
    return 0;
}

