//
//  AddressCard.h
//  Ue3-Vorgabe
//
//  Created by Markus Bruns on 13/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject <NSCoding> {
    NSString *Vorname;
    NSString *Nachname;
    NSString *Strasse;
    NSNumber *Hausnummer;
    NSNumber *Postleitzahl;
    NSString *Ort;
    NSMutableArray *HobbyList;
    NSMutableArray *FriendList;
}

@property(retain) NSString *Vorname;
@property(retain) NSString *Nachname;
@property(retain) NSString *Strasse;
@property(retain) NSNumber *Hausnummer;
@property(retain) NSNumber *Postleitzahl;
@property(retain) NSString *Ort;
@property(retain) NSMutableArray *HobbyList;
@property(retain) NSMutableArray *FriendList;

- (void)addHobby:(NSString*)hobby;
- (void)removeHobby:(NSString*)hobby;
- (void)addFriend:(AddressCard*)card;
- (void)removeFriend:(AddressCard*)card;

@end
