//
//  BARPlaceFetcher.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//


#import "BARPlaceFetcher.h"

#import <AFNetworking/AFNetworking.h>

#import "BARPlace.h"
#import "BARLocation.h"
#import "BARPhoto.h"

#import "BARKeys.h"

static NSString *kFoursquareURL = @"https://api.foursquare.com/v2/venues/explore";
static NSString *kFoursquareNearKey = @"near";
static NSString *kFoursquareVersionKey = @"v";
static NSString *kFoursquareVersion = @"20140327";
static NSString *kFoursquareLimitKey = @"limit";
static NSString *kFoursquareLimit = @"10  ";
static NSString *kFoursquareSectionKey = @"section";
static NSString *kFoursquareSection = @"drinks";
static NSString *kFoursquareOpenNowKey = @"openNow";
static NSString *kFoursquareOpenNowValue = @"1";
static NSString *kCityName = @"San Francisco, CA";
static NSString *kVenuePhotosKey = @"venuePhotos";
static NSString *kVenuePhotosValue = @"1";

@implementation BARPlaceFetcher

- (void)fetchRandomPlaceInNeighbourhood:(NSString *)neighbourhood
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  NSDictionary *parameters = @{
                               [BARKeys clientIDKey] : [BARKeys clientID],
                               [BARKeys clientSecretKey] : [BARKeys clientSecret],
                               kFoursquareNearKey : [NSString stringWithFormat:@"%@, %@", neighbourhood, @"San Francisco, CA, United States"],
                               kFoursquareVersionKey : kFoursquareVersion,
                               kFoursquareLimitKey : kFoursquareLimit,
                               kFoursquareSectionKey : kFoursquareSection,
                               kFoursquareOpenNowKey : kFoursquareOpenNowValue,
                               kVenuePhotosKey : kVenuePhotosValue
                               };
  [manager GET:kFoursquareURL
    parameters:parameters
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSMutableArray *venues = [NSMutableArray array];
         
         NSDictionary *response = responseObject[@"response"];
         NSArray *groups = response[@"groups"];
         NSDictionary *firstItem = groups.firstObject;
         NSArray *items = firstItem[@"items"];
         [items enumerateObjectsUsingBlock:^(NSDictionary *item, NSUInteger idx, BOOL *stop) {
           NSDictionary *venue = item[@"venue"];
           NSDictionary *locationDict = venue[@"location"];
           NSArray *formattedAddress = locationDict[@"formattedAddress"];
           BARLocation *location = [[BARLocation alloc] initWithAddress:formattedAddress[0]
                                                                   city:formattedAddress[1]];
           NSDictionary *photos = venue[@"photos"];
           NSArray *photoGroups = photos[@"groups"];
           NSArray *photoItems = photoGroups.firstObject[@"items"];
           NSDictionary *firstPhoto = photoItems.firstObject;
           BARPhoto *photo = [[BARPhoto alloc] initWithPrefix:firstPhoto[@"prefix"]
                                                       suffix:firstPhoto[@"suffix"]];
           BARPlace *place = [[BARPlace alloc] initWithVenueID:venue[@"id"]
                                                          name:venue[@"name"]
                                                      location:location
                                                         photo:photo];
           [venues addObject:place];
         }];
         [_delegate barPlaceFetcher:self
                      didFetchVenues:[venues copy]];
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
       }];
}


@end
