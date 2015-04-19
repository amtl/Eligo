//
//  BARPlaceFetcher.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARPlaceFetcher;

@protocol BARPlaceFetcherDelegate<NSObject>

- (void)barPlaceFetcher:(BARPlaceFetcher *)placeFetcher
          didFetchVenues:(NSArray *)venues;

@end


@interface BARPlaceFetcher : NSObject

@property (nonatomic, weak, readwrite) id<BARPlaceFetcherDelegate> delegate;

- (void)fetchRandomPlaceInNeighbourhood:(NSString *)neighbourhood;

@end
