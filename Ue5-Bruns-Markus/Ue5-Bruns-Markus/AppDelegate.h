//
//  AppDelegate.h
//  Ue5-Bruns-Markus
//
//  Created by Markus Bruns on 04/12/13.
//  Copyright (c) 2013 Markus Bruns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBook.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    AddressBook *book;
}

@property (strong, nonatomic) UIWindow *window;

@property(retain) AddressBook *book;

@end
