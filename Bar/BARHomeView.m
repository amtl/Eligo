
//
//  BARHomeView.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARHomeView.h"

#import "BARAppearance.h"

NSString *NeighbourhoodLabel()
{
  return NSLocalizedString(@"Find me a bar in", @"Qualifying Label");
}

NSString *SearchTitle()
{
  return NSLocalizedString(@"SEARCH", @"Search Button Title");
}

static CGFloat kSearchButtonRadius = 60;

@interface BARHomeView()

@end

@implementation BARHomeView
{
  UILabel *_neighbourhoodPickerLabel;
  UIButton *_neighbourhoodPickerButton;
  UIButton *_searchButton;
  UITextField *_textField;
}

- (instancetype)initWithNeighbourhood:(NSString *)neighbourhood
{
  if (self = [super initWithFrame:CGRectZero]) {
    self.backgroundColor = [UIColor blackColor];
    
    _neighbourhoodPickerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _neighbourhoodPickerLabel.text = NeighbourhoodLabel();
    _neighbourhoodPickerLabel.textColor = [UIColor whiteColor];
    _neighbourhoodPickerLabel.textAlignment = NSTextAlignmentCenter;
    _neighbourhoodPickerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:19];
    [self addSubview:_neighbourhoodPickerLabel];
    
    _neighbourhoodPickerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_neighbourhoodPickerButton setTitle:neighbourhood forState:UIControlStateNormal];
    [_neighbourhoodPickerButton setTitleColor:[BARAppearance yellowColor] forState:UIControlStateNormal];
    _neighbourhoodPickerButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:19];
    _neighbourhoodPickerButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [_neighbourhoodPickerButton addTarget:self action:@selector(_neighbourhoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_neighbourhoodPickerButton];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_searchButton setTitle:SearchTitle() forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(_searchPressed:) forControlEvents:UIControlEventTouchUpInside];
    _searchButton.backgroundColor = [BARAppearance yellowColor];
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _searchButton.layer.cornerRadius = kSearchButtonRadius;
    _searchButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15];
    [self addSubview:_searchButton];
    
    _neighbourhoodPickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectZero];
    _textField.inputView = _neighbourhoodPickerView;
    [self addSubview:_textField];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect bounds = self.bounds;
  _searchButton.center = CGPointMake(CGRectGetWidth(bounds) / 2, CGRectGetHeight(bounds) * 2 / 3);
  _searchButton.bounds = CGRectMake(0, 0, 2 * kSearchButtonRadius, 2 * kSearchButtonRadius);
  
  CGRect neighbourhoodPickerLabelRect = [_neighbourhoodPickerLabel textRectForBounds:bounds limitedToNumberOfLines:1];
  _neighbourhoodPickerLabel.frame = CGRectMake(CGRectGetWidth(bounds) / 2 - CGRectGetWidth(neighbourhoodPickerLabelRect) / 2,
                                               CGRectGetHeight(bounds) / 3 - CGRectGetHeight(neighbourhoodPickerLabelRect),
                                               CGRectGetWidth(neighbourhoodPickerLabelRect),
                                               CGRectGetHeight(neighbourhoodPickerLabelRect));
  
  CGSize neighbourhoodPickerButtonSize = [_neighbourhoodPickerButton sizeThatFits:bounds.size];
  _neighbourhoodPickerButton.frame = CGRectMake(CGRectGetWidth(bounds) / 2 - CGRectGetWidth(neighbourhoodPickerLabelRect) / 2,
                                                CGRectGetHeight(bounds) / 3,
                                                neighbourhoodPickerButtonSize.width,
                                                neighbourhoodPickerButtonSize.height);
}

- (void)_searchPressed:(UIButton *)sender
{
  [_delegate barHomeViewDidPressSearchButton:self];
}

- (void)_neighbourhoodButtonPressed:(UIButton *)sender
{
  [_textField becomeFirstResponder];
}

- (void)setNeighbourhood:(NSString *)neigbourhood
{
  [_neighbourhoodPickerButton setTitle:neigbourhood forState:UIControlStateNormal];
  [self setNeedsLayout];
  [_textField resignFirstResponder];
}

- (void)_doneButtonPressed:(UIControl *)sender
{
}

@end
