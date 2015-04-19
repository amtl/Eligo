//
//  BARRandomVenueService.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARRandomVenueService, BARPlace, BARNeighbourhood;

@protocol BARRandomVenueServiceDelegate <NSObject>

- (void)randomVenueService:(BARRandomVenueService *)service didFetchRandomVenue:(BARPlace *)place;

@end

@interface BARRandomVenueService : NSObject

@property (nonatomic, weak, readwrite) id<BARRandomVenueServiceDelegate> delegate;

+ (instancetype)sharedInstance;
- (void)fetchRandomVenueInNeighbourhood:(BARNeighbourhood *)neighbourhood;

@end
