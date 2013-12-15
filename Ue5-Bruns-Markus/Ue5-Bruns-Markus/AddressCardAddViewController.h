//
//  AddressCardAddViewController.h
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 12/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBook.h"
#import "AddressCard.h"

@interface AddressCardAddViewController : UIViewController <UITextFieldDelegate>


- (IBAction)addNewAddresscardToAddressbook:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *firstname;
@property (weak, nonatomic) IBOutlet UITextField *lastname;
@property (weak, nonatomic) IBOutlet UITextField *street;
@property (weak, nonatomic) IBOutlet UITextField *streetnumber;
@property (weak, nonatomic) IBOutlet UITextField *zip;
@property (weak, nonatomic) IBOutlet UITextField *city;

@property(retain) AddressBook *addressbook;
@property(retain) AddressCard *card;

@end
