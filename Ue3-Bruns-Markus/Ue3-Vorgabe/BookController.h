//
//  BookController.h
//  Ue3-Vorgabe
//
//  Created by Klaus Jung on 31.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"


@interface BookController : NSObject {
    AddressBook *book;
}

@property(retain) AddressBook *book;
- (void)run;


@end
