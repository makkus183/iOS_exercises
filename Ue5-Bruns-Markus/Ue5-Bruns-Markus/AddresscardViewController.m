//
//  AddresscardViewController.m
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 28/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import "AddresscardViewController.h"
#import "AppDelegate.h"
#import "AddresscardAddFriendsController.h"

@interface AddresscardViewController ()

@end

@implementation AddresscardViewController
@synthesize card;

@synthesize textFieldFirstname;
@synthesize textFieldLastname;
@synthesize textFieldStreet;
@synthesize textFieldStreetnumber;
@synthesize textFieldZip;
@synthesize textFieldCity;

@synthesize textFieldAddHobby;
@synthesize labelAddFriends;

@synthesize textfields;


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

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self completeTextfields];
    self.textfields = [NSMutableArray arrayWithObjects:
                           self.textFieldFirstname,
                           self.textFieldLastname,
                           self.textFieldStreet,
                           self.textFieldStreetnumber,
                           self.textFieldZip,
                           self.textFieldCity,
                           self.textFieldAddHobby,
                           nil];
}

- (void)viewAddresscard:(AddressCard *)addresscard {
    if (self.card != addresscard) {
        self.card = addresscard;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 6;
            break;
        case 1:
            return [self.card.hobbyList count] + 1;
        case 2:
            return [self.card.friendList count] + 1;
        default:
            return 1;
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"";
    cell.indentationWidth = 10.0;
    cell.indentationLevel = 0;
    cell.tag = 0;

    [[cell.contentView viewWithTag:TF_FIRSTNAME]removeFromSuperview];
    [[cell.contentView viewWithTag:TF_LASTNAME]removeFromSuperview];
    [[cell.contentView viewWithTag:TF_STREET]removeFromSuperview];
    [[cell.contentView viewWithTag:TF_STREETNUMBER]removeFromSuperview];
    [[cell.contentView viewWithTag:TF_ZIP]removeFromSuperview];
    [[cell.contentView viewWithTag:TF_CITY]removeFromSuperview];
    [[cell.contentView viewWithTag:BTN_ADD_HOBBY]removeFromSuperview];
    [[cell.contentView viewWithTag:BTN_ADD_FRIENDS]removeFromSuperview];
    
    
    // Detail section
    if([indexPath section] == 0) {
        NSLog(@"Labeltext: %@", cell.textLabel.text);
        switch ([indexPath row] ) {
            case 0:
                [cell.contentView addSubview:self.textFieldFirstname];
                break;
            case 1:
                [cell.contentView addSubview:self.textFieldLastname];
                break;
            case 2:
                [cell.contentView addSubview:self.textFieldStreet];
                break;
            case 3:
                [cell.contentView addSubview:self.textFieldStreetnumber];
                break;
            case 4:
                [cell.contentView addSubview:self.textFieldZip];
                break;
            case 5:
                [cell.contentView addSubview:self.textFieldCity];
                break;
            default:
                break;
        }
    }
    // Hobbies section
    if([indexPath section] == 1) {
        if (indexPath.row < self.card.hobbyList.count) {
            cell.textLabel.text = self.card.hobbyList[indexPath.row];
        } else {
            self.textFieldAddHobby.placeholder = @"Push Edit to add Hobby";
            self.textFieldAddHobby.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:self.textFieldAddHobby];
        }
    }
    // Friends section
    if([indexPath section] == 2) {
        if (indexPath.row < self.card.friendList.count) {
            AddressCard *friend = self.card.friendList[indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",friend.firstname, friend.lastname];
        } else {
            cell.textLabel.text = @"Add friends";
            cell.tag = BTN_ADD_FRIENDS;
            cell.indentationWidth = 100;
            cell.indentationLevel = 1;
            UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeContactAdd];
            btnAdd.tag = BTN_ADD_FRIENDS;
            btnAdd.frame = CGRectMake(10.0, 10.0, 25.0, 25.0);
            btnAdd.userInteractionEnabled = NO;
            [cell.contentView addSubview:btnAdd];
        }
    }
    return cell;
}

-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Details";
            break;
        case 1:
            return @"Hobbies";
        case 2:
            return @"Friends";
        default:
            return @"Title";
            break;
    }
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.section == 0) {
        return NO;
    }
    if (indexPath.section == 1) {
        return YES;
    }
    if (indexPath.section == 2) {
        if (indexPath.row < self.card.friendList.count) {
            return YES;
        } else {
            return NO;
        }
    }

    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if([indexPath section] == 1) {
            [self.card.hobbyList removeObjectAtIndex:indexPath.row];
        }
        if([indexPath section] == 2) {
            [self.card.friendList removeObjectAtIndex:indexPath.row];
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Hobbies section
        if([indexPath section] == 1) {
            [self.card addHobby:self.textFieldAddHobby.text];
            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            self.textFieldAddHobby.text = @"";
        }
    }   
}

// Editing Settings
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Hobbies section
    if([indexPath section] == 1) {
        if (indexPath.row < self.card.hobbyList.count) {
            return UITableViewCellEditingStyleDelete;
        } else {
            return UITableViewCellEditingStyleInsert;
        }
    }
    // Friendlist section
    if([indexPath section] == 2) {
        if (indexPath.row < self.card.friendList.count) {
            return UITableViewCellEditingStyleDelete;
        } else {
            return UITableViewCellEditingStyleNone;
        }
    }
    return UITableViewCellEditingStyleNone;
}

// to check when editing started and ended.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    NSLog(@"Editing %i", editing);
    [super setEditing:editing animated:animated];
    [self toggleTextfieldEditMode:editing];
    if (editing) {
        //..
    } else {
        [self updateEditedAddresscardData];
    }
}

// To make the keyboard disappear after pushing enter button
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


// Condition for AddFriends
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 2) {
        if(cell.tag == BTN_ADD_FRIENDS){
           [self performSegueWithIdentifier:@"addFriends" sender:cell];
        }
    }
}

// To update friendlist after selecting from modalview
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
      if ([[segue identifier] isEqualToString:@"addFriends"]) {
          [[segue destinationViewController] listFriendsForCard:self.card];
          NSLog(@"going to modal..");
      }
}


- (void)completeTextfields {
    self.textFieldFirstname = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 185, 30)];
    self.textFieldLastname = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 185, 30)];
    self.textFieldStreet = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 185, 30)];
    self.textFieldStreetnumber = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 185, 30)];
    self.textFieldZip = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 185, 30)];
    self.textFieldCity = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 185, 30)];
    
    self.textFieldAddHobby = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, 285, 30)];
    
    self.textFieldFirstname.tag = TF_FIRSTNAME;
    self.textFieldFirstname.placeholder = @"Firstname";
    self.textFieldFirstname.text = self.card.firstname;
    self.textFieldFirstname.delegate = self;
    self.textFieldFirstname.enabled = NO;
    
    self.textFieldLastname.tag = TF_LASTNAME;
    self.textFieldLastname.placeholder = @"Lastname";
    self.textFieldLastname.text = self.card.lastname;
    self.textFieldLastname.enabled = NO;
    self.textFieldLastname.delegate = self;
    
    self.textFieldStreet.tag = TF_STREET;
    self.textFieldStreet.placeholder = @"Street";
    self.textFieldStreet.text = self.card.street;
    self.textFieldStreet.enabled = NO;
    self.textFieldStreet.delegate = self;
    
    self.textFieldStreetnumber.tag = TF_STREETNUMBER;
    self.textFieldStreetnumber.placeholder = @"Streetnumber";
    self.textFieldStreetnumber.text = self.card.streetnumber.stringValue;
    self.textFieldStreetnumber.enabled = NO;
    self.textFieldStreetnumber.delegate = self;
    
    self.textFieldZip.tag = TF_ZIP;
    self.textFieldZip.placeholder = @"ZIP";
    self.textFieldZip.text = self.card.zip.stringValue;
    self.textFieldZip.enabled = NO;
    self.textFieldZip.delegate = self;
    
    self.textFieldCity.tag = TF_CITY;
    self.textFieldCity.placeholder = @"City";
    self.textFieldCity.text = self.card.city;
    self.textFieldCity.enabled = NO;
    self.textFieldCity.delegate = self;
    
    self.textFieldAddHobby.tag = BTN_ADD_HOBBY;
    self.textFieldAddHobby.placeholder = @"Push Edit to add Hobby";
    self.textFieldAddHobby.enabled = NO;
    self.textFieldAddHobby.delegate = self;
}

- (void)toggleTextfieldEditMode:(BOOL)editingOn {
    for(UITextField *textfield in self.textfields) {
        textfield.enabled = editingOn;
    }
    if(editingOn) {
        self.textFieldAddHobby.placeholder = @"Enter Hobby";
    } else {
        self.textFieldAddHobby.placeholder = @"Push Edit to add Hobby";
    }
}

- (void)updateEditedAddresscardData {
    self.card.firstname = self.textFieldFirstname.text;
    self.card.lastname = self.textFieldLastname.text;
    self.card.street = self.textFieldStreet.text;
    if(self.textFieldStreetnumber.text.length > 0) {
        self.card.streetnumber = [NSNumber numberWithInt:[self.textFieldStreetnumber.text integerValue]];
    }
    if(self.textFieldZip.text.length > 0) {
        self.card.zip = [NSNumber numberWithInt:[self.textFieldZip.text integerValue]];
    }
    self.card.city = self.textFieldCity.text;
}

@end
