//
//  ELIPhotosViewController.m
//  Eligo
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "ELIPhotosViewController.h"

#import "BARPlace.h"
#import "BARPhoto.h"

#import "ELIVenuePhotosService.h"
#import "ELIPhotoCollectionViewCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface ELIPhotosViewController ()
<
ELIVenuePhotosServiceDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>

@end

@implementation ELIPhotosViewController
{
  ELIVenuePhotosService *_photosService;
  NSArray *_photos;
  
  UICollectionView *_collectionView;
}

- (instancetype)init
{
  if (self = [super init]) {
    _photosService = [ELIVenuePhotosService sharedInstance];
  }
  return self;
}

- (void)loadView
{
  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  layout.minimumInteritemSpacing = 0;
  layout.minimumLineSpacing = 0;
  layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
  _collectionView.delegate = self;
  _collectionView.dataSource = self;
  _collectionView.pagingEnabled = YES;
  _collectionView.showsHorizontalScrollIndicator = NO;
  [_collectionView registerClass:[ELIPhotoCollectionViewCell class]
      forCellWithReuseIdentifier:NSStringFromClass([ELIPhotoCollectionViewCell class])];
  self.view = _collectionView;
}

- (void)setPlace:(BARPlace *)place
{
  _photos = @[place.photo];
  [_collectionView reloadData];
  _photosService.delegate = self;
  [_photosService fetchPhotosForVenue:place];
}

#pragma mark - ELIVenuePhotosServiceDelegate

- (void)photoService:(ELIVenuePhotosService *)service
      didFetchPhotos:(NSArray *)photos
            forVenue:(NSString *)venueID
{
  _photos = photos;
  [_collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  ELIPhotoCollectionViewCell *photoCell = [_collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ELIPhotoCollectionViewCell class])
                                                                                     forIndexPath:indexPath];
  BARPhoto *photo = _photos[indexPath.row];
  NSString *placeURL = [NSString stringWithFormat:@"%@%tu%@", photo.prefix, 2 * (NSUInteger)CGRectGetWidth(self.view.bounds), photo.suffix];
  NSURL *url = [NSURL URLWithString:placeURL];
  [photoCell.imageView sd_setImageWithURL:url];
  return photoCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
  return _photos.count;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CGFloat width = CGRectGetWidth(_collectionView.bounds);
  return CGSizeMake(width, width);
}

@end
