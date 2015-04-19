//
//  BARPhoto.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BARPhoto : NSObject

- (instancetype)initWithPrefix:(NSString *)prefix suffix:(NSString *)suffix;

@property (nonatomic, strong, readonly) NSString *prefix;
@property (nonatomic, strong, readonly) NSString *suffix;

@end
