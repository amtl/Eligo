//
//  ELIVenueStore.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARPlace;

@interface ELIVenueStore : NSObject

@property (nonatomic, assign, readonly, getter=isEmpty) BOOL empty;

- (void)addVenues:(NSArray *)venues;
- (BARPlace *)randomVenue;

@end
