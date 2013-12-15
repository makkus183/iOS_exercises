//
//  MasterViewController.h
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController {

    NSMutableArray *addresscards;

}
-(NSString *)getFormattedAddressForDetailLabel:(NSString *)street withStreetnumber:(NSNumber *)streetnumber withZip:(NSNumber *)zip andCity:(NSString *)city;

@property(retain) NSMutableArray *addresscards;

@end

