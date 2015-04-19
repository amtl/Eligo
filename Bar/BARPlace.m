//
//  BARPlace.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARPlace.h"

@implementation BARPlace

- (instancetype)initWithVenueID:(NSString *)venueID
                           name:(NSString *)name
                       location:(BARLocation *)location
                          photo:(BARPhoto *)photo
{
  if (self = [super init]) {
    _venueID = venueID;
    _name = name;
    _location = location;
    _photo = photo;
  }
  return self;
}

@end
