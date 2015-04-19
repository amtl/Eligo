
//
//  ELIRandomVenueNeighbourhoodServiceProvider.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "ELIRandomVenueNeighbourhoodServiceProvider.h"

#import "BARNeighbourhood.h"
#import "ELIRandomVenueNeighbourhoodService.h"

@implementation ELIRandomVenueNeighbourhoodServiceProvider
{
  NSMutableDictionary *_services;
}

- (instancetype)init
{
  if (self = [super init]) {
    _services = [NSMutableDictionary dictionary];
  }
  return self;
}

- (ELIRandomVenueNeighbourhoodService *)randomVenueServiceForNeighbourhood:(BARNeighbourhood *)neighbourhood
{
  ELIRandomVenueNeighbourhoodService *service = [_services objectForKey:neighbourhood.name];
  if (!service) {
    service = [[ELIRandomVenueNeighbourhoodService alloc] initWithNeighbourhood:neighbourhood];
    _services[neighbourhood.name] = service;
  }
  return service;
}

@end
