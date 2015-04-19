//
//  ELIVenuePhotosService.h
//  Eligo
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARPlace, ELIVenuePhotosService;

@protocol ELIVenuePhotosServiceDelegate <NSObject>

- (void)photoService:(ELIVenuePhotosService *)service
      didFetchPhotos:(NSArray *)photos
            forVenue:(NSString *)venueID;

@end

@interface ELIVenuePhotosService : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, weak, readwrite) id<ELIVenuePhotosServiceDelegate> delegate;

- (void)fetchPhotosForVenue:(BARPlace *)venue;

@end
