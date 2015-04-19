
//
//  BARPlaceView.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARPlaceView.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import "BARPlace.h"
#import "BARLocation.h"

static CGFloat kLeftPadding = 16;

@implementation BARPlaceView
{
  UIView *_photosView;
  UILabel *_addressLabel;
  UILabel *_cityLabel;
  UILabel *_openNowLabel;
  UILabel *_hoursLabel;
}

- (instancetype)initWithPhotosView:(UIView *)photosView
{
  if (self = [super initWithFrame:CGRectZero]) {
    _photosView = photosView;
    [self addSubview:_photosView];
    
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _addressLabel.textColor = [UIColor whiteColor];
    _addressLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self addSubview:_addressLabel];
    
    _cityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _cityLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    _cityLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [self addSubview:_cityLabel];
    
    _openNowLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _openNowLabel.textColor = [UIColor whiteColor];
    _openNowLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:11];
    [self addSubview:_openNowLabel];
    
    _hoursLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _hoursLabel.textColor = [UIColor whiteColor];
    _hoursLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [self addSubview:_hoursLabel];
    
    self.backgroundColor = [UIColor blackColor];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect bounds = self.bounds;
  CGFloat imageSize = CGRectGetWidth(bounds);
  _photosView.frame = CGRectMake(0, 0, imageSize, imageSize);
  
  CGRect addressLabelRect = [_addressLabel textRectForBounds:bounds
                                      limitedToNumberOfLines:1];
  _addressLabel.frame = CGRectMake(kLeftPadding,
                                   CGRectGetMaxY(_photosView.frame) + kLeftPadding,
                                   CGRectGetWidth(addressLabelRect),
                                   CGRectGetHeight(addressLabelRect));
  
  CGRect cityLabelRect = [_cityLabel textRectForBounds:bounds
                                limitedToNumberOfLines:1];
  _cityLabel.frame = CGRectMake(kLeftPadding,
                                CGRectGetMaxY(_addressLabel.frame),
                                CGRectGetWidth(cityLabelRect),
                                CGRectGetHeight(cityLabelRect));
  
  CGRect hoursLabelRect = [_hoursLabel textRectForBounds:bounds
                                  limitedToNumberOfLines:1];
  _hoursLabel.frame = CGRectMake(CGRectGetWidth(bounds) - kLeftPadding - CGRectGetWidth(hoursLabelRect),
                                  CGRectGetMaxY(_addressLabel.frame) - CGRectGetHeight(hoursLabelRect),
                                  CGRectGetWidth(hoursLabelRect),
                                  CGRectGetHeight(hoursLabelRect));
  
  CGRect openNowLabelRect = [_openNowLabel textRectForBounds:bounds
                                      limitedToNumberOfLines:1];
  _openNowLabel.frame = CGRectMake(CGRectGetWidth(bounds) - kLeftPadding - CGRectGetWidth(openNowLabelRect),
                                   CGRectGetMaxY(_hoursLabel.frame),
                                   CGRectGetWidth(openNowLabelRect),
                                   CGRectGetHeight(openNowLabelRect));
  
  _addressLabel.frame = CGRectMake(kLeftPadding,
                                   CGRectGetMaxY(_photosView.frame) + kLeftPadding,
                                   CGRectGetWidth(bounds) - CGRectGetWidth(hoursLabelRect) - 3 * kLeftPadding,
                                   CGRectGetHeight(addressLabelRect));
}

- (void)setPlace:(BARPlace *)place
{
  _addressLabel.text = place.location.address;
  _cityLabel.text = place.location.city;
  _openNowLabel.text = NSLocalizedString(@"OPEN NOW", @"");
  _hoursLabel.text = NSLocalizedString(@"12 PM - 2 AM", @"");
  [self setNeedsLayout];
}

@end
