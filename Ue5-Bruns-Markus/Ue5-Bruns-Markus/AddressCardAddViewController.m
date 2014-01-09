//
//  AddressCardAddViewController.m
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 12/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import "AddressCardAddViewController.h"
#import "AppDelegate.h"
#import "AddressBook.h"

@interface AddressCardAddViewController () {
    
    AddressBook *_addressbook;
    AddressCard *card;
}

@end

@implementation AddressCardAddViewController

@synthesize firstname;
@synthesize lastname;
@synthesize street;
@synthesize streetnumber;
@synthesize zip;
@synthesize city;

@synthesize card;
@synthesize addressbook;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.addressbook = app.book;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)addNewAddresscardToAddressbook {
    NSLog(@"saving card..");
    self.card = [[AddressCard alloc] init];
    self.card.firstname = [[self.firstname text] length] != 0 ? [self.firstname text] : @"";
    self.card.lastname = [[self.lastname text] length] != 0 ? [self.lastname text] : @"";
    self.card.street = [[self.street text] length] != 0 ? [self.street text] : @"";
    self.card.streetnumber = [[self.streetnumber text] length] != 0 ? [NSNumber numberWithInt:[self.streetnumber.text intValue]] : nil;
    self.card.zip = [[self.zip text] length] != 0 ? [NSNumber numberWithInt:[self.zip.text intValue]] : nil;
    self.card.city = [[self.city text] length] != 0 ? [self.city text] : @"";
    [self.addressbook addCard:card];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"addToMaster"]) {
        [self addNewAddresscardToAddressbook];
    }
}
@end
