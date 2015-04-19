//
//  BARPhotosFetcher.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARPhotosFetcher.h"

#import <AFNetworking/AFNetworking.h>

#import "BARPhoto.h"

#import "BARKeys.h"

static NSString *kFoursquareURL = @"https://api.foursquare.com/v2/venues/%@/photos";
static NSString *kFoursquareVersionKey = @"v";
static NSString *kFoursquareVersion = @"20150327";
static NSString *kFoursquareLimitKey = @"limit";
static NSString *kFoursquareLimit = @"5";

@implementation BARPhotosFetcher

- (void)fetchPhotosForVenue:(NSString *)venueID
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  NSDictionary *parameters = @{
                               [BARKeys clientIDKey] : [BARKeys clientID],
                               [BARKeys clientSecretKey] : [BARKeys clientSecret],
                               kFoursquareVersionKey : kFoursquareVersion,
                               kFoursquareLimitKey : kFoursquareLimit,
                               };
  [manager GET:[NSString stringWithFormat:kFoursquareURL, venueID]
    parameters:parameters
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *response = responseObject[@"response"];
         NSDictionary *photos = response[@"photos"];
         NSArray *items = photos[@"items"];
         NSMutableArray *venuePhotos = [NSMutableArray array];
         
         [items enumerateObjectsUsingBlock:^(NSDictionary *item, NSUInteger idx, BOOL *stop) {
           BARPhoto *photo = [[BARPhoto alloc] initWithPrefix:item[@"prefix"]
                                                       suffix:item[@"suffix"]];
           [venuePhotos addObject:photo];
         }];
         
         [_delegate photosFetcher:self
                   didFetchPhotos:[venuePhotos copy]
                         forVenue:venueID];
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
       }];
}

@end
