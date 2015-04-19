//
//  ELIVenueStore.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "ELIVenueStore.h"

#import "BARPlace.h"

@implementation ELIVenueStore
{
  NSCache *_venueCache;
  NSMutableArray *_allKeys;
}

- (instancetype)init
{
  if (self = [super init]) {
    _venueCache = [[NSCache alloc] init];
    _allKeys = [NSMutableArray array];
  }
  return self;
}

- (BARPlace *)randomVenue
{
  NSUInteger randomIndex =  rand() % _allKeys.count;
  NSString *randomKey = _allKeys[randomIndex];
  BARPlace *venue = [_venueCache objectForKey:randomKey];
  return venue;
}

- (void)addVenues:(NSArray *)venues
{
  [venues enumerateObjectsUsingBlock:^(BARPlace *venue, NSUInteger idx, BOOL *stop) {
    [_allKeys addObject:venue.venueID];
    [_venueCache setObject:venue forKey:venue.venueID];
  }];
}

- (BOOL)isEmpty
{
  return _allKeys.count == 0;
}

@end
