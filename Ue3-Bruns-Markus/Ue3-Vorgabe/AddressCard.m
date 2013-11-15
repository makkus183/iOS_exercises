//
//  AddressCard.m
//  Ue3-Vorgabe
//
//  Created by Markus Bruns on 13/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize Vorname;
@synthesize Nachname;
@synthesize Strasse;
@synthesize Hausnummer;
@synthesize Postleitzahl;
@synthesize Ort;
@synthesize HobbyList;
@synthesize FriendList;

-(id)init{
    if(self = [super init]) {
        self.HobbyList = [[NSMutableArray alloc] init];
        self.FriendList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addHobby:(NSString*)hobby {
    [self.HobbyList addObject:hobby];
}
- (void)removeHobby:(NSString*)hobby {
    [self.HobbyList removeObject:hobby];
//    for (NSString *currentHobby in self.HobbyList) {
//        if ([currentHobby isEqualToString:hobby]) {
//            [self.HobbyList removeObject:hobby];
//        }
//    }

}
- (void)addFriend:(AddressCard*)card {
    [self.FriendList addObject:card];
}

- (void)removeFriend:(AddressCard*)card {
    [self.FriendList removeObjectIdenticalTo:card];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:Vorname forKey:@"Vorname"];
    [encoder encodeObject:Nachname forKey:@"Nachname"];
    [encoder encodeObject:Strasse forKey:@"Strasse"];
    [encoder encodeObject:Hausnummer forKey:@"Hausnummer"];
    [encoder encodeObject:Postleitzahl forKey:@"Postleitzahl"];
    [encoder encodeObject:Ort forKey:@"Ort"];
    [encoder encodeObject:HobbyList forKey:@"HobbyList"];
    [encoder encodeObject:FriendList forKey:@"FriendList"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.Vorname = [decoder decodeObjectForKey:@"Vorname"];
        self.Nachname = [decoder decodeObjectForKey:@"Nachname"];
        self.Strasse = [decoder decodeObjectForKey:@"Strasse"];
        self.Hausnummer = [decoder decodeObjectForKey:@"Hausnummer"];
        self.Postleitzahl = [decoder decodeObjectForKey:@"Postleitzahl"];
        self.Ort = [decoder decodeObjectForKey:@"Ort"];
        self.HobbyList = [decoder decodeObjectForKey:@"HobbyList"];
        self.FriendList = [decoder decodeObjectForKey:@"FriendList"];

    }
    return self;
}

@end