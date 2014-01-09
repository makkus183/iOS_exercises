//
//  AddresscardAddFriendsController.m
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/01/14.
//  Copyright (c) 2014 Markus Bruns. All rights reserved.
//

#import "AddresscardAddFriendsController.h"
#import "AppDelegate.h"
#import "AddressBook.h"
#import "AddressCard.h"

@interface AddresscardAddFriendsController ()

@end

@implementation AddresscardAddFriendsController

@synthesize addresscards;
@synthesize addressbook;
@synthesize card;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.addressbook = app.book;
    self.addresscards = app.book.addresscards;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    AddressCard *friend = self.addresscards[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",friend.firstname, friend.lastname];
    if([self.card.friendList containsObject:friend]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        [self.card addFriend:addresscards[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else if(cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        [self.card removeFriend:addresscards[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
- (void)listFriendsForCard:(AddressCard *)activeCard {
    self.card = activeCard;
    NSLog(@"Active Card : %@", self.card.firstname);
}

- (IBAction)commitFriendSelection:(id)sender {
    NSLog(@"Done Button pressed");
    [self dismissViewControllerAnimated:YES completion:NULL];
}



@end
