//
//  AddressCard.m
//  Ue3-Vorgabe
//
//  Created by Markus Bruns on 13/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize firstname;
@synthesize lastname;
@synthesize street;
@synthesize streetnumber;
@synthesize zip;
@synthesize city;
@synthesize hobbyList;
@synthesize friendList;

-(id)init{
    if(self = [super init]) {
        self.hobbyList = [[NSMutableArray alloc] init];
        self.friendList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addHobby:(NSString*)hobby {
    [self.hobbyList addObject:hobby];
}
- (void)removeHobby:(NSString*)hobby {
    [self.hobbyList removeObject:hobby];
//    for (NSString *currentHobby in self.HobbyList) {
//        if ([currentHobby isEqualToString:hobby]) {
//            [self.HobbyList removeObject:hobby];
//        }
//    }

}
- (void)addFriend:(AddressCard*)card {
    [self.friendList addObject:card];
}

- (void)removeFriend:(AddressCard*)card {
    [self.friendList removeObjectIdenticalTo:card];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:firstname forKey:@"firstname"];
    [encoder encodeObject:lastname forKey:@"lastname"];
    [encoder encodeObject:street forKey:@"street"];
    [encoder encodeObject:streetnumber forKey:@"streetnumber"];
    [encoder encodeObject:zip forKey:@"zip"];
    [encoder encodeObject:city forKey:@"city"];
    [encoder encodeObject:hobbyList forKey:@"hobbyList"];
    [encoder encodeObject:friendList forKey:@"friendList"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.firstname = [decoder decodeObjectForKey:@"firstname"];
        self.lastname = [decoder decodeObjectForKey:@"lastname"];
        self.street = [decoder decodeObjectForKey:@"street"];
        self.streetnumber = [decoder decodeObjectForKey:@"streetnumber"];
        self.zip = [decoder decodeObjectForKey:@"zip"];
        self.city = [decoder decodeObjectForKey:@"city"];
        self.hobbyList = [decoder decodeObjectForKey:@"hobbyList"];
        self.friendList = [decoder decodeObjectForKey:@"friendList"];

    }
    return self;
}

@end