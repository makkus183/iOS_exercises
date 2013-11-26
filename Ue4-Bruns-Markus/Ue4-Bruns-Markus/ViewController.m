//
//  ViewController.m
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "ViewController.h"
#import "ExchangeCalculator.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize calculator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calculator = [[ExchangeCalculator alloc] init];
    fieldEurUsdRate.text = [NSString stringWithFormat:@"%f", calculator.eurToUsdRate];
    fieldEurGbpRate.text = [NSString stringWithFormat:@"%f", calculator.eurToGbpRate];
    // Do any additional setup after loading the view, typically from a nib.
    
   }

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
 }


- (void)dealloc
{
    [fieldEur release];
    [fieldGbp release];
    [fieldUsd release];
    [fieldEurUsdRate release];
    [fieldEurGbpRate release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}



- (IBAction)valEurUpdated:(id)sender {
    self.calculator.eur = [fieldEur.text doubleValue];
    [self.calculator updateAmounts:0];
    [self updateFields];
}

- (IBAction)valGbpUpdated:(id)sender {
    self.calculator.gbp = [fieldGbp.text doubleValue];
    [self.calculator updateAmounts:1];
    [self updateFields];

}

- (IBAction)valUsdUpdated:(id)sender {
    self.calculator.usd = [fieldUsd.text doubleValue];
    [self.calculator updateAmounts:2];
    [self updateFields];
}

- (IBAction)rateEurUsdUpdated:(id)sender {
    self.calculator.eurToUsdRate = [fieldEurUsdRate.text doubleValue];
    [self.calculator updateAmounts:0];
    [self updateFields];

}

- (IBAction)rateEurGbpUpdated:(id)sender {
    self.calculator.eurToGbpRate = [fieldEurGbpRate.text doubleValue];
    [self.calculator updateAmounts:0];
    [self updateFields];

}

- (IBAction)getOnlineExchangeRates:(id)sender {
    NSString *eurToUsd = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://download.finance.yahoo.com/d/quotes.csv?s=EURUSD=X&f=a"] encoding:NSASCIIStringEncoding error:nil];
    if(eurToUsd) {
        self.calculator.eurToUsdRate = [eurToUsd doubleValue];
        fieldEurUsdRate.text = [NSString stringWithFormat:@"%lf", self.calculator.eurToUsdRate];
        [self.calculator updateAmounts:0];
        [self updateFields];
    }
    NSString *eurToGbp = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://download.finance.yahoo.com/d/quotes.csv?s=EURGBP=X&f=a"] encoding:NSASCIIStringEncoding error:nil];
    if(eurToGbp) {
        self.calculator.eurToGbpRate = [eurToGbp doubleValue];
        fieldEurGbpRate.text = [NSString stringWithFormat:@"%lf", self.calculator.eurToGbpRate];
        [self.calculator updateAmounts:0];
        [self updateFields];
        
    }
    


    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(void)updateFields{
    fieldEur.text = [NSString stringWithFormat:@"%.2lf", self.calculator.eur];
    fieldGbp.text = [NSString stringWithFormat:@"%.2lf", self.calculator.gbp];
    fieldUsd.text = [NSString stringWithFormat:@"%.2lf", self.calculator.usd];
}
@end
