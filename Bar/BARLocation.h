//
//  BARLocation.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 18/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BARLocation : NSObject

- (instancetype)initWithAddress:(NSString *)address
                           city:(NSString *)city;

@property (nonatomic, strong, readonly) NSString *address;
@property (nonatomic, strong, readonly) NSString *city;

@end
