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
        self.addresscards = [[[NSMutableArray alloc] init] autorelease];
    }
    return self;
}

- (void)addCard:(AddressCard*)card {
    
    [self.addresscards addObject:card];
    [self sortByLastname];
}
- (void)removeCard:(AddressCard*)card {
    for (AddressCard *cardContainingFriend in self.addresscards) {
        [cardContainingFriend removeFriend:card];
    }
    [self.addresscards removeObjectIdenticalTo:card];
}
- (void)sortByLastname {
    NSLog(@"sorting function executed");
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastname"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [self.addresscards sortedArrayUsingDescriptors:sortDescriptors];
    self.addresscards = [sortedArray mutableCopy];
    [sortDescriptor release];

}
- (AddressCard*)searchCardByLastname:(NSString*)lastname {
    AddressCard *cardwithLastname = nil;
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

- (void)dealloc {
    [addresscards release];
    [super dealloc];
}

@end
