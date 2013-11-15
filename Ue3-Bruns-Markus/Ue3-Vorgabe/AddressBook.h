//
//  AddressBook.h
//  Ue3-Vorgabe
//
//  Created by Markus Bruns on 13/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject <NSCoding> {
    NSMutableArray *Addresskarten;
    
    
}

@property(retain) NSMutableArray *Addresskarten;

- (void)addCard:(AddressCard*)card;
- (void)removeCard:(AddressCard*)card;
- (void)sortByLastname;
- (void)searchCardByLastname;
- (BOOL)saveToFile:(NSString*)path;
+ (id)addressBookWithFile:(NSString*)path;

@end
