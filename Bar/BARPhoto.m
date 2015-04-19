//
//  BARPhoto.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARPhoto.h"

@implementation BARPhoto

- (instancetype)initWithPrefix:(NSString *)prefix
                        suffix:(NSString *)suffix
{
  if (self = [super init]) {
    _prefix = prefix;
    _suffix = suffix;
  }
  return self;
}

@end
