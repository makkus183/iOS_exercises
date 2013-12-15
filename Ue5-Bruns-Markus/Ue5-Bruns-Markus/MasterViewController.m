//
//  MasterViewController.m
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "AddressCardAddViewController.h"

#import "AppDelegate.h"
#import "AddressCard.h"

@interface MasterViewController () {

}
@end

@implementation MasterViewController

@synthesize addresscards;
@synthesize addressbook;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;

    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.addressbook = app.book;
    self.addresscards = app.book.addresscards;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.addresscards.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    NSDate *object = _objects[indexPath.row];
    AddressCard *card = self.addresscards[indexPath.row];
    cell.textLabel.text = [card.firstname length] != 0 || [card.lastname length] != 0  ? [NSString stringWithFormat:@"%@ %@", card.firstname, card.lastname] : @"";
    cell.detailTextLabel.text = [self getFormattedAddressForDetailLabel:card.street withStreetnumber:card.streetnumber withZip:card.zip andCity:card.city];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.addresscards removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showCard"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AddressCard *card = self.addresscards[indexPath.row];
        [[segue destinationViewController] setAddresscard:card];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // to get the Addresscards sorted and updated
    self.addresscards = self.addressbook.addresscards;
    [self.tableView reloadData];
}

- (NSString *)getFormattedAddressForDetailLabel:(NSString *)street withStreetnumber:(NSNumber *)streetnumber withZip:(NSNumber *)zip andCity:(NSString *)city {
    street = [street length] != 0 ? street : @"";
    NSString *streetnumberString = streetnumber != 0 ? [streetnumber stringValue] : @"";
    
    city = [city length] != 0 ? city : @"";
    NSString *zipString = zip != 0 ? [zip stringValue] : @"";
    
    NSString *streetWithNumber = [[NSString stringWithFormat:@"%@ %@", street, streetnumberString]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *zipWithCity = [[NSString stringWithFormat:@"%@ %@", zipString, city]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *formattedFullAddress = @"";
    if ([streetWithNumber length] == 0 && [zipWithCity length] != 0) {
        formattedFullAddress = zipWithCity;
    }
    
    if ([streetWithNumber length] != 0 && [zipWithCity length] == 0) {
        formattedFullAddress = streetWithNumber;
    }
    
    if ([streetWithNumber length] != 0 && [zipWithCity length] != 0) {
        formattedFullAddress = [NSString stringWithFormat:@"%@, %@",streetWithNumber, zipWithCity ];
    }
    
    return formattedFullAddress;
}

@end
