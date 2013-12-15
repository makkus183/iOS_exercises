//
//  AddressCard.h
//  Ue3-Vorgabe
//
//  Created by Markus Bruns on 13/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject <NSCoding> {
    NSString *firstname;
    NSString *lastname;
    NSString *street;
    NSNumber *streetnumber;
    NSNumber *zip;
    NSString *city;
    NSMutableArray *hobbyList;
    NSMutableArray *friendList;
}

@property(retain) NSString *firstname;
@property(retain) NSString *lastname;
@property(retain) NSString *street;
@property(retain) NSNumber *streetnumber;
@property(retain) NSNumber *zip;
@property(retain) NSString *city;
@property(retain) NSMutableArray *hobbyList;
@property(retain) NSMutableArray *friendList;

- (void)addHobby:(NSString*)hobby;
- (void)removeHobby:(NSString*)hobby;
- (void)addFriend:(AddressCard*)card;
- (void)removeFriend:(AddressCard*)card;

@end
