//
//  BARPhotosFetcher.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BARPhotosFetcher;

@protocol BARPhotosFetcherDelegate <NSObject>

- (void)photosFetcher:(BARPhotosFetcher *)photosFetcher
       didFetchPhotos:(NSArray *)photos
             forVenue:(NSString *)venueID;

@end

@interface BARPhotosFetcher : NSObject

@property (nonatomic, weak, readwrite) id<BARPhotosFetcherDelegate> delegate;

- (void)fetchPhotosForVenue:(NSString *)venueID;

@end
