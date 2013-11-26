//
//  ViewController.h
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExchangeCalculator.h"


@interface ViewController : UIViewController <UITextFieldDelegate, NSURLConnectionDelegate> {
 
    IBOutlet UITextField *fieldEurUsdRate;
    IBOutlet UITextField *fieldEurGbpRate;
    
    IBOutlet UITextField *fieldEur;
    IBOutlet UITextField *fieldGbp;
    IBOutlet UITextField *fieldUsd;
    
    ExchangeCalculator *calculator;
}

- (IBAction)valEurUpdated:(id)sender;
- (IBAction)valGbpUpdated:(id)sender;
- (IBAction)valUsdUpdated:(id)sender;

- (IBAction)rateEurUsdUpdated:(id)sender;
- (IBAction)rateEurGbpUpdated:(id)sender;

- (IBAction)getOnlineExchangeRates:(id)sender;


@property(retain) ExchangeCalculator *calculator;

@end
