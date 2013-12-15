//
//  DetailViewController.m
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "AddressCard.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setAddresscard:(AddressCard *)card
{
    if (self.card != card) {
        self.card = card;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.card) {
        [self setAddresscardLabels];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setAddresscardLabels {
    if (self.card) {
        self.firstname.text = self.card.firstname;
        self.lastname.text = self.card.lastname;
        self.street.text = self.card.street;
        self.streetnumber.text = [self.card.streetnumber stringValue];
        self.zip.text = [self.card.zip stringValue];
        self.city.text = self.card.city;
        
        // todo dynamic sizing of labels like float left
        [self.firstname sizeToFit];
        [self.lastname sizeToFit];
        [self.street sizeToFit];
        [self.streetnumber sizeToFit];
        [self.zip sizeToFit];
        [self.city sizeToFit];
    }
}

@end
