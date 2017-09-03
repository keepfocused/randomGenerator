//
//  QuoteHolder.m
//  randomGenerator
//
//  Created by Admin on 28.08.17.
//  Copyright © 2017 Galiev Danil. All rights reserved.
//

#import "QuoteHolder.h"

@implementation QuoteHolder

- (instancetype)initWithQuotes
{
    self = [super init];
    if (self) {

        NSBundle* mainBundle;

        // Get the main bundle for the app.
        mainBundle = [NSBundle mainBundle];


        NSLog(@"%@",mainBundle);







    }
    return self;
}



@end
