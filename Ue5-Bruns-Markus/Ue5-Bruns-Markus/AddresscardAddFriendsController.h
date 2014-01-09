//
//  AddresscardAddFriendsController.h
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/01/14.
//  Copyright (c) 2014 Markus Bruns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBook.h"
#import "AddressCard.h"

@interface AddresscardAddFriendsController : UITableViewController {
    AddressBook *addressbook;
    NSMutableArray *addresscards;
    AddressCard *card;

}

@property(retain) NSMutableArray *addresscards;
@property(retain) AddressBook *addressbook;
@property(retain) AddressCard *card;

- (IBAction)commitFriendSelection:(id)sender;
- (void)listFriendsForCard:(AddressCard *)activeCard;


@end
