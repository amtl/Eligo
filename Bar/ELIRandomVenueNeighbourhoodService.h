//
//  ELIRandomVenueNeighbourhoodService.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARNeighbourhood, ELIRandomVenueNeighbourhoodService, BARPlace;

@protocol ELIRandomVenueNeighbourhoodServiceDelegate <NSObject>

- (void)randomVenueService:(ELIRandomVenueNeighbourhoodService *)service
       didFetchRandomVenue:(BARPlace *)place;

@end

@interface ELIRandomVenueNeighbourhoodService : NSObject

@property (nonatomic, weak, readwrite) id<ELIRandomVenueNeighbourhoodServiceDelegate> delegate;

- (instancetype)initWithNeighbourhood:(BARNeighbourhood *)neighbourhood;
- (void)fetchRandomVenue;

@end
