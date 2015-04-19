  //
//  BARAppearance.m
//  Bar
//
//  Created by Andrea Mittelstaedt on 19/04/15.
//  Copyright (c) 2015 Andrea. All rights reserved.
//

#import "BARAppearance.h"

@implementation BARAppearance


+ (void)setUp
{
  [[UIBarButtonItem appearance] setTintColor:[BARAppearance yellowColor]];
  [[UINavigationBar appearance] setTintColor:[BARAppearance yellowColor]];
  [[UINavigationBar appearance] setTranslucent:NO];
  [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
  [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
  [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

+ (UIColor *)yellowColor
{
  return [UIColor colorWithHue:.125 saturation:.33 brightness:1 alpha:1];
}

@end
