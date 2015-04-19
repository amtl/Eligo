//
//  ELIVenuePhotosService.m
//  Eligo
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "ELIVenuePhotosService.h"

#import "BARPhotosFetcher.h"

#import "BARPlace.h"

@interface ELIVenuePhotosService() <BARPhotosFetcherDelegate>

@end

@implementation ELIVenuePhotosService
{
  BARPhotosFetcher *_photosFetcher;
}

+ (instancetype)sharedInstance
{
  static dispatch_once_t once_token;
  static ELIVenuePhotosService *sharedInstance;
  dispatch_once(&once_token, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (instancetype)init
{
  if (self = [super init]) {
    _photosFetcher = [[BARPhotosFetcher alloc] init];
    _photosFetcher.delegate = self;
  }
  return self;
}


- (void)fetchPhotosForVenue:(BARPlace *)venue
{
  [_photosFetcher fetchPhotosForVenue:venue.venueID];
}

#pragma mark - BARPhotosFetcherDelegate

- (void)photosFetcher:(BARPhotosFetcher *)photosFetcher
       didFetchPhotos:(NSArray *)photos
             forVenue:(NSString *)venueID
{
  [_delegate photoService:self
           didFetchPhotos:photos
                 forVenue:venueID];
}

@end
