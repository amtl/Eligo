//
//  ELIRandomVenueNeighbourhoodServiceProvider.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ELIRandomVenueNeighbourhoodService, BARNeighbourhood;

@interface ELIRandomVenueNeighbourhoodServiceProvider : NSObject

- (ELIRandomVenueNeighbourhoodService *)randomVenueServiceForNeighbourhood:(BARNeighbourhood *)neighbourhood;

@end
