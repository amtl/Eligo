//
//  ELIRandomVenueNeighbourhoodService.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "ELIRandomVenueNeighbourhoodService.h"

#import "BARNeighbourhood.h"
#import "BARPlaceFetcher.h"
#import "ELIVenueStore.h"

@interface ELIRandomVenueNeighbourhoodService() <BARPlaceFetcherDelegate>

@end

@implementation ELIRandomVenueNeighbourhoodService
{
  BARNeighbourhood *_neighbourhood;
  BARPlaceFetcher *_fetcher;
  ELIVenueStore *_venueStore;
}

- (instancetype)initWithNeighbourhood:(BARNeighbourhood *)neighbourhood
{
  if (self = [super init]) {
    _neighbourhood = neighbourhood;
    _fetcher = [[BARPlaceFetcher alloc] init];
    _fetcher.delegate = self;
    _venueStore = [[ELIVenueStore alloc] init];
  }
  return self;
}

- (void)fetchRandomVenue
{
  if (_venueStore.isEmpty) {
    [_fetcher fetchRandomPlaceInNeighbourhood:_neighbourhood.name];
  } else {
    BARPlace *venue = [_venueStore randomVenue];
    [_delegate randomVenueService:self
              didFetchRandomVenue:venue];
  }
}

#pragma mark - BARPlaceFetcherDelegate

- (void)barPlaceFetcher:(BARPlaceFetcher *)placeFetcher
         didFetchVenues:(NSArray *)venues
{
  [_venueStore addVenues:venues];
  BARPlace *venue = [_venueStore randomVenue];
  [_delegate randomVenueService:self
            didFetchRandomVenue:venue];
}

@end
