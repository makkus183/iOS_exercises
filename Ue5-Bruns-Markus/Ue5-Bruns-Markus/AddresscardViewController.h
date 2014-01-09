//
//  AddresscardViewController.h
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 28/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressCard.h"

@interface AddresscardViewController : UITableViewController <UITextFieldDelegate>{
    
    UITextField *textFieldFirstname;
    UITextField *textFieldLastname;
    UITextField *textFieldStreet;
    UITextField *textFieldStreetnumber;
    UITextField *textFieldZip;
    UITextField *textFieldCity;
    
    UITextField *textFieldAddHobby;
    UILabel *labelAddFriends;
    
    NSMutableArray *textfields;
    
}

@property(retain) AddressCard *card;

@property(retain) UITextField *textFieldFirstname;
@property(retain) UITextField *textFieldLastname;
@property(retain) UITextField *textFieldStreet;
@property(retain) UITextField *textFieldStreetnumber;
@property(retain) UITextField *textFieldZip;
@property(retain) UITextField *textFieldCity;

@property(retain) UITextField *textFieldAddHobby;
@property(retain) UILabel *labelAddFriends;


@property(retain) NSMutableArray *textfields;

- (void)viewAddresscard:(AddressCard *)card;

@end
