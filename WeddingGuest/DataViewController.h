//
//  DataViewController.h
//  WeddingGuest
//
//  Created by David Henry on 15/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wedding.h"

@interface DataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
