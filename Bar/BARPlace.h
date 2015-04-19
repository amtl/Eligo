//
//  BARPlace.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARLocation, BARPhoto;

@interface BARPlace : NSObject

- (instancetype)initWithVenueID:(NSString *)venueID
                           name:(NSString *)name
                       location:(BARLocation *)location
                          photo:(BARPhoto *)photo;

@property (nonatomic, readonly, strong) NSString *venueID;
@property (nonatomic, readonly, strong) NSString *name;
@property (nonatomic, readonly, strong) BARLocation *location;
@property (nonatomic, readonly, copy)  BARPhoto *photo;

@end

