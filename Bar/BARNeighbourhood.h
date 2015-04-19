//
//  BARNeighbourhood.h
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BARNeighbourhood : NSObject

- (instancetype)initWithName:(NSString *)name;

@property (nonatomic, copy, readonly) NSString *name;

@end
