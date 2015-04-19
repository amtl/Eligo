//
//  ELIPhotoCollectionViewCell.m
//  Eligo
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "ELIPhotoCollectionViewCell.h"

@implementation ELIPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:CGRectZero]) {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor grayColor];
    [self addSubview:_imageView];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect bounds = self.bounds;
  _imageView.frame = bounds;
}

@end
