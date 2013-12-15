//
//  DetailViewController.h
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressCard.h"

@interface DetailViewController : UIViewController

@property(retain) AddressCard *card;

@property (weak, nonatomic) IBOutlet UILabel *firstname;
@property (weak, nonatomic) IBOutlet UILabel *lastname;
@property (weak, nonatomic) IBOutlet UILabel *street;
@property (weak, nonatomic) IBOutlet UILabel *streetnumber;
@property (weak, nonatomic) IBOutlet UILabel *zip;
@property (weak, nonatomic) IBOutlet UILabel *city;

- (void)setAddresscard:(AddressCard *)card;

@end
