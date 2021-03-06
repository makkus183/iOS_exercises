//
//  BookController.m
//  Ue3-Vorgabe
//
//  Created by Klaus Jung on 31.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "BookController.h"
#import "IOHelper.h"
#import "AddressBook.h"
#import "AddressCard.h"

@interface BookController()
- (void)enterCard;
- (void)lookupCard;
- (void)printBook;
@end


@implementation BookController
@synthesize book;

- (void)run {
    self.book = [[AddressBook alloc] init];
    self.book.addresscards = [AddressBook addressBookWithFile:@"book.archive"];
    if([self.book.addresscards count] == 0) {
        self.book.addresscards = [[NSMutableArray alloc] init];
    }
    // main loop

    NSString *ask = @"\n(E)ingabe, (S)uche, (L)iste oder (Q)uit?";
    char sel;
    
    while((sel = [IOHelper prompt:ask]) != 'q') {
        switch(sel) {
            case 'e':
                [self enterCard];
                break;
            case 's':
                [self lookupCard];
                break;
            case 'l':
                [self printBook];
                break;
        }
    }
    
    if (![self.book saveToFile:@"book.archive"]){
        NSLog(@"Save to file failed");
    };
}

- (void)enterCard {
    [IOHelper printLineWithFormat:@"Neue Karte anlegen:"];
    AddressCard *card = [[AddressCard alloc] init];
    card.firstname = [IOHelper readLineWithMessage:@"Vorname"];
    card.lastname = [IOHelper readLineWithMessage:@"Nachname"];
    card.street = [IOHelper readLineWithMessage:@"Strasse"];
    card.streetnumber = [IOHelper readIntegerNumberWithMessage:@"Hausnummer"];
    card.zip = [IOHelper readIntegerNumberWithMessage:@"Postleitzahl"];
    card.city = [IOHelper readLineWithMessage:@"Ort"];
    NSString *ask = @"Hobby: (Abbruch mit (Q))";
    NSString *hobby;
    while(![(hobby = [IOHelper readLineWithMessage:ask]) isEqualToString:@"q"]) {
        [card addHobby:hobby];
    }
    [ask release];
    [hobby release];

    
    [self.book addCard:card];
    [card autorelease];
}

- (void)lookupCard {
    NSString *searchName = [IOHelper readLineWithMessage:@"Suchname:"];
    AddressCard *searchedCard;
    searchedCard = [self.book searchCardByLastname:searchName];
    if (searchedCard) {
        [self printCard:searchedCard];
        NSString *ask = @"(F)reund/in hinzufügen, (L)öschen oder (Z)urück?";
        char sel;
        
        while((sel = [IOHelper prompt:ask]) != 'z') {
            switch(sel) {
                case 'f':
                    [self addFriend:searchedCard];
                    break;
                case 'l':
                    [self deleteCard:searchedCard];
                    break;
            }
        }

    } else {
        [IOHelper printLineWithFormat:@"Namen nicht gefunden."];
    }
 }

- (void)printBook {
    NSLog(@"Size of book %lu", (unsigned long)[self.book.addresscards count]);
    for (AddressCard *card in self.book.addresscards) {
        [self printCard:card];
    }
}

- (void)addFriend:(AddressCard*)card {
    NSString *searchName = [IOHelper readLineWithMessage:@"Suchname Freund/in:"];
    AddressCard *searchedCard;
    searchedCard = [self.book searchCardByLastname:searchName];
    if(searchedCard) {
        [card addFriend:searchedCard];
        [IOHelper printLineWithFormat:@"%@ %@ als Freund/in hinzugefügt", searchedCard.firstname, searchedCard.lastname];
    } else {
        [IOHelper printLineWithFormat:@"Namen nicht gefunden"];
    }
}

- (void)deleteCard:(AddressCard*)card {
    [IOHelper printLineWithFormat:@"Karte gelöscht"];
    [self.book removeCard:card];
}

- (void)printCard:(AddressCard*)card {
    NSString *seperator = @"+-----------------------------------";
    [IOHelper printLineWithFormat:seperator];
    [IOHelper printLineWithFormat:[NSString stringWithFormat:@"| Vorname: %@", card.firstname]];
    [IOHelper printLineWithFormat:[NSString stringWithFormat:@"| Nachname: %@", card.lastname]];
    [IOHelper printLineWithFormat:[NSString stringWithFormat:@"| Strasse: %@", card.street]];
    [IOHelper printLineWithFormat:[NSString stringWithFormat:@"| Hausnummer: %@", card.streetnumber]];
    [IOHelper printLineWithFormat:[NSString stringWithFormat:@"| PLZ: %@", card.zip]];
    [IOHelper printLineWithFormat:[NSString stringWithFormat:@"| Ort: %@", card.city]];
    [IOHelper printLineWithFormat:@"| Hobbys:"];
    if ([card.hobbyList count] > 0) {
        for (NSString *hobby in card.hobbyList) {
            [IOHelper printLineWithFormat:[NSString stringWithFormat:@"|    %@", hobby]];
        }
    } else {
        [IOHelper printLineWithFormat:@"|   none"];
    }
    [IOHelper printLineWithFormat:@"| Friends:"];
    if ([card.friendList count] > 0) {
        
        for (AddressCard *friend in card.friendList) {
            [IOHelper printLineWithFormat:[NSString stringWithFormat:@"|    %@ %@", friend.firstname, friend.lastname]];
        }
    } else {
        [IOHelper printLineWithFormat:@"|   none"];
    }
    [IOHelper printLineWithFormat:seperator];
}

@end
