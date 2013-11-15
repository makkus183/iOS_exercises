//
//  AddressBook.m
//  Ue3-Vorgabe
//
//  Created by Markus Bruns on 13/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook
    
    @synthesize addresscards;


-(id)init{
    if(self = [super init]) {
        self.addresscards = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCard:(AddressCard*)card {
    
    [self.addresscards addObject:card];
    [self sortByLastname];
}
- (void)removeCard:(AddressCard*)card {
    [self.addresscards removeObjectIdenticalTo:card];
}
- (void)sortByLastname {
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastname"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [self.addresscards sortedArrayUsingDescriptors:sortDescriptors];
    self.addresscards = [sortedArray mutableCopy];
}
- (AddressCard*)searchCardByLastname:(NSString*)lastname {
    AddressCard *cardwithLastname;
    for (AddressCard *card in self.addresscards) {
        if ([card.lastname isEqualToString:lastname]) {
            cardwithLastname = card;
        }
    }
    return cardwithLastname;
}
- (BOOL)saveToFile:(NSString*)path {
    return [NSKeyedArchiver archiveRootObject:self.addresscards toFile:path];
}

+ (id)addressBookWithFile:(NSString*)path {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.addresscards forKey:@"Adresskarten"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.addresscards = [decoder decodeObjectForKey:@"Adresskarten"];
    }
    return self;
}

@end
