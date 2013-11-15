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
}
- (void)removeCard:(AddressCard*)card {
    
}
- (void)sortByLastname {
    
}
- (void)searchCardByLastname {
    
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
