//
//  BARNeigbourhoodFetcher.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  BARNeigbourhoodFetcher;

@protocol BARNeighbourhoodFetcherDelegate <NSObject>

- (void)neighbourhoodFetcherDidFetchNeighbourhoods:(BARNeigbourhoodFetcher *)fetcher;

@end

@interface BARNeigbourhoodFetcher : NSObject

@property (nonatomic, weak, readwrite) id<BARNeighbourhoodFetcherDelegate> delegate;
@property (nonatomic, copy, readonly) NSArray *neighbourhoods;

- (void)fetchNeigbourHoods;

@end
