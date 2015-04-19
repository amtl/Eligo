//
//  BARPlaceViewController.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BARPlaceViewController, BARNeighbourhood;

@protocol BARPlaceViewControllerDelegate

- (void)placeViewControllerDidPressCancel:(BARPlaceViewController *)placeViewController;

@end

@interface BARPlaceViewController : UIViewController

@property (nonatomic, weak, readwrite) id<BARPlaceViewControllerDelegate> delegate;

- (instancetype)initWithNeighbourhood:(BARNeighbourhood *)neighbourhood;

@end
