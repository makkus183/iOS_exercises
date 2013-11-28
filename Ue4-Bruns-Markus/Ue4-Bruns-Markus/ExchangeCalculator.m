//
//  ExchangeCalculator.m
//  Ue2-Vorgabe
//
//  Created by Markus Bruns on 20/11/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "ExchangeCalculator.h"

@implementation ExchangeCalculator

@synthesize eurToUsdRate;
@synthesize eurToGbpRate;

@synthesize eur;
@synthesize gbp;
@synthesize usd;

-(id)init{
    if(self = [super init]) {
        self.eurToUsdRate = 1.3479;
        self.eurToGbpRate = 0.8371;
    }
    return self;
}


-(void)updateAmounts:(int)keptCurrencyIndex {
    switch (keptCurrencyIndex) {
        case 0:
            self.gbp = self.eur * eurToGbpRate;
            self.usd = self.eur * eurToUsdRate;
            break;
        case 1:
            self.eur = self.gbp / eurToGbpRate;
            self.usd = self.eur * eurToUsdRate;
            break;
        case 2:
            self.eur = self.usd / eurToUsdRate;
            self.gbp = self.eur * eurToGbpRate;
            break;
        default:
            break;
    }
}

@end
