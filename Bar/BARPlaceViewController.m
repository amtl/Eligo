
//
//  BARPlaceViewController.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARPlaceViewController.h"

#import "BARPlaceView.h"

#import "BARPhoto.h"

#import "BARPlace.h"

#import "BARRandomVenueService.h"

#import "ELIPhotosViewController.h"

@interface BARPlaceViewController () <BARRandomVenueServiceDelegate>

@end

@implementation BARPlaceViewController
{
  BARNeighbourhood *_neighbourhood;
  BARPlaceView *_placeView;
  
  BARRandomVenueService *_randomVenueService;
  ELIPhotosViewController *_photosViewController;
}

- (instancetype)initWithNeighbourhood:(BARNeighbourhood *)neighbourhood
{
  if (self = [super init]) {
    _neighbourhood = neighbourhood;
    _randomVenueService = [BARRandomVenueService sharedInstance];
  }
  return self;
}

- (void)loadView
{
  _photosViewController = [[ELIPhotosViewController alloc] init];
  [self addChildViewController:_photosViewController];
  _placeView = [[BARPlaceView alloc] initWithPhotosView:_photosViewController.view];
  self.view = _placeView;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                target:self
                                                                action:@selector(_refreshPressed:)];
  [self.navigationItem setRightBarButtonItem:refreshButton];
  
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  _randomVenueService.delegate = self;
  [_randomVenueService fetchRandomVenueInNeighbourhood:_neighbourhood];
}

#pragma mark - BARRandomVenueServiceDelegate

- (void)randomVenueService:(BARRandomVenueService *)service
       didFetchRandomVenue:(BARPlace *)place
{
  [self.navigationItem setTitle:place.name];
  [_placeView setPlace:place];
  [_photosViewController setPlace:place];
}

- (void)_cancelPressed:(UIBarButtonItem *)barButton
{
  [_delegate placeViewControllerDidPressCancel:self];
}

- (void)_refreshPressed:(UIBarButtonItem *)barButton
{
  
  
  [_randomVenueService fetchRandomVenueInNeighbourhood:_neighbourhood];
}

@end
//