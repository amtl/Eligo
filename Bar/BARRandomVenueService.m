//
//  BARRandomVenueService.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARRandomVenueService.h"

#import "ELIRandomVenueNeighbourhoodService.h"
#import "ELIRandomVenueNeighbourhoodServiceProvider.h"

@interface BARRandomVenueService() <ELIRandomVenueNeighbourhoodServiceDelegate>

@end

@implementation BARRandomVenueService
{
  ELIRandomVenueNeighbourhoodServiceProvider *_serviceProvider;
}

+ (instancetype)sharedInstance
{
  static dispatch_once_t once_token;
  static BARRandomVenueService *sharedInstance;
  dispatch_once(&once_token, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (instancetype)init
{
  if (self = [super init]) {
    _serviceProvider = [[ELIRandomVenueNeighbourhoodServiceProvider alloc] init];
  }
  return self;
}

- (void)fetchRandomVenueInNeighbourhood:(BARNeighbourhood *)neighbourhood
{
  ELIRandomVenueNeighbourhoodService *randomVenueService = [_serviceProvider randomVenueServiceForNeighbourhood:neighbourhood];
  randomVenueService.delegate = self;
  [randomVenueService fetchRandomVenue];
}

#pragma mark - ELIRandomNeighbourhoodServiceDelegate

- (void)randomVenueService:(ELIRandomVenueNeighbourhoodService *)service
       didFetchRandomVenue:(BARPlace *)place
{
  [_delegate randomVenueService:self
            didFetchRandomVenue:place];
}

@end
