//
//  BARNeigbourhoodFetcher.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARNeigbourhoodFetcher.h"

#import "BARNeighbourhood.h"

#import <AFNetworking/AFNetworking.h>

#import "BARKeys.h"

static NSString *kFoursquareURL = @"https://api.foursquare.com/v2/venues/search";
static NSString *kNeighbourhoodCategoryKey = @"categoryId";
static NSString *kNeighbourhoodCategoryID = @"4f2a25ac4b909258e854f55f";
static NSString *kFoursquareNearKey = @"near";
static NSString *kFoursquareNearLocation = @"San Francisco,CA";
static NSString *kFoursquareVersionKey = @"v";
static NSString *kFoursquareVersion = @"20140327";

@implementation BARNeigbourhoodFetcher

- (void)fetchNeigbourHoods
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  NSDictionary *parameters = @{
                               [BARKeys clientIDKey] : [BARKeys clientID],
                               [BARKeys clientSecretKey] : [BARKeys clientSecret],
                               kNeighbourhoodCategoryKey : kNeighbourhoodCategoryID,
                               kFoursquareNearKey : kFoursquareNearLocation,
                               kFoursquareVersionKey : kFoursquareVersion
                               };
  [manager GET:kFoursquareURL
    parameters:parameters
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *response = responseObject[@"response"];
         NSArray *venues = response[@"venues"];
         NSMutableArray *neighbourhoods = [NSMutableArray array];
         [venues enumerateObjectsUsingBlock:^(NSDictionary *neighbourhood, NSUInteger idx, BOOL *stop) {
           BARNeighbourhood *bNeighbourhood = [[BARNeighbourhood alloc] initWithName:neighbourhood[@"name"]];
           [neighbourhoods addObject:bNeighbourhood];
         }];
         _neighbourhoods = neighbourhoods;
         [_delegate neighbourhoodFetcherDidFetchNeighbourhoods:self];
         
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
       }];
}

@end
