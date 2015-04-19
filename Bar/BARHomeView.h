//
//  BARHomeView.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BARHomeView;

@protocol BARHomeViewDelegate <NSObject>

- (void)barHomeViewDidPressSearchButton:(UIView *)barHomeView;

@end

@interface BARHomeView : UIView

- (instancetype)initWithNeighbourhood:(NSString *)neighbourhood;

@property (nonatomic, strong, readonly) UIPickerView *neighbourhoodPickerView;

@property (nonatomic, weak, readwrite) id<BARHomeViewDelegate> delegate;

- (void)setNeighbourhood:(NSString *)neigbourhood;

@end
