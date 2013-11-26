//
//  ExchangeCalculator.h
//  Ue2-Vorgabe
//
//  Created by Markus Bruns on 20/11/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExchangeCalculator : NSObject {

    double eurToUsdRate;
    double eurToGbpRate;
    
    double eur;
    double gbp;
    double usd;
}

@property double eurToUsdRate;
@property double eurToGbpRate;

@property double eur;
@property double gbp;
@property double usd;


-(void)updateAmounts:(int)keptCurrency;

@end


