//
//  BARLocation.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARLocation.h"

@implementation BARLocation

- (instancetype)initWithAddress:(NSString *)address
                           city:(NSString *)city
{
  if (self = [super init]) {
    _address = address;
    _city = city;
  }
  return self;
}

@end
