//
//  ModelController.h
//  WeddingGuest
//
//  Created by David Henry on 15/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wedding.h"

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
