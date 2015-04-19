//
//  BARPlaceView.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BARPlace;

@interface BARPlaceView : UIView

- (instancetype)initWithPhotosView:(UIView *)photosView;

- (void)setPlace:(BARPlace *)place;

@end
