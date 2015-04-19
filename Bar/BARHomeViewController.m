//
//  BARHomeViewController.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//


#import "BARHomeViewController.h"

#import "BARNeigbourhoodFetcher.h"
#import "BARPlaceViewController.h"

#import "BARNeighbourhood.h"

#import "BARHomeView.h"

static BARNeighbourhood *DefaultNeighbourhood()
{
  return [[BARNeighbourhood alloc] initWithName:NSLocalizedString(@"The Mission District", @"")];
}

@interface BARHomeViewController () < BARNeighbourhoodFetcherDelegate, UIPickerViewDelegate, UIPickerViewDataSource, BARHomeViewDelegate, BARPlaceViewControllerDelegate>

@end

@implementation BARHomeViewController
{
  BARNeigbourhoodFetcher *_fetcher;
  NSArray *_neighbourhoods;
  BARHomeView *_homeView;
  BARNeighbourhood *_currentNeighbourhood;
}

- (void)loadView
{
  _currentNeighbourhood = DefaultNeighbourhood();
  _homeView = [[BARHomeView alloc] initWithNeighbourhood:_currentNeighbourhood.name];
  _homeView.neighbourhoodPickerView.delegate = self;
  _homeView.neighbourhoodPickerView.dataSource = self;
  _homeView.delegate = self;
  self.view = _homeView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = NSLocalizedString(@"Search", @"");
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  _fetcher = [[BARNeigbourhoodFetcher alloc] init];
  _fetcher.delegate = self;
  [_fetcher fetchNeigbourHoods];
  [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}

#pragma mark - BARNeighbourhoodFetcherDelegate

- (void)neighbourhoodFetcherDidFetchNeighbourhoods:(BARNeigbourhoodFetcher *)fetcher
{
  _neighbourhoods = _fetcher.neighbourhoods;
  
  [_homeView.neighbourhoodPickerView reloadAllComponents];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return _neighbourhoods.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
  BARNeighbourhood *neighbourhood = _neighbourhoods[row];
  return neighbourhood.name;
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
  _currentNeighbourhood = _neighbourhoods[row];
  [_homeView setNeighbourhood:_currentNeighbourhood.name];
}

#pragma mark - BARHomeViewDelegate

- (void)barHomeViewDidPressSearchButton:(UIView *)barHomeView
{
  BARPlaceViewController *placeViewController = [[BARPlaceViewController alloc] initWithNeighbourhood:_currentNeighbourhood];
  placeViewController.delegate = self;
  [self.navigationController pushViewController:placeViewController animated:YES];
}

#pragma mark - BARPlaceViewControllerDelegate

- (void)placeViewControllerDidPressCancel:(BARPlaceViewController *)placeViewController
{
  [self.navigationController popViewControllerAnimated:YES];
}

@end
