//
//  DataViewController.m
//  WeddingGuest
//
//  Created by David Henry on 15/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "DataViewController.h"
#import "views/UIViewWithBorder.h"
#import <QuartzCore/QuartzCore.h>

@interface DataViewController ()
-(void)addButton:(Wedding*)details top:(int)top;
-(void)addNewWeddingButton:(int)top;
-(void)nothing;
@end

@implementation DataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = @"Upcoming Weddings"; //[self.dataObject description];

    NSArray *detailsArray = self.dataObject;
    
    int top = 60;
    for (Wedding *details in detailsArray) {
        [self addButton:details top:top];
        top = top + 60;
    }
    
    [self addNewWeddingButton:top];
}
-(void)addNewWeddingButton:(int)top 
{
    
}
-(void)clickWedding
{
    NSLog(@"button click");
}
-(void)addButton:(Wedding*)details top:(int)top
{
    CGRect    viewRect = CGRectMake(35, top, 250, 50);
    CGRect weddingRect = CGRectMake(50, 5, 195, 20);
    CGRect    dateRect = CGRectMake(50, 25, 195, 20);
    CGRect   imageRect = CGRectMake(3, 3, 40, 40);
    
    UIViewWithBorder *view = [[UIViewWithBorder alloc] initWithFrame:viewRect];
    
    [view addTouchUpEvent:self action:@selector(clickWedding)];
    UILabel *weddingLabel = [[UILabel alloc] initWithFrame:weddingRect];
    weddingLabel.text = [details wedding];
    [view addSubview:weddingLabel];

    UILabel *dateLabel = [[UILabel alloc] initWithFrame:dateRect];;
    dateLabel.text = [details dateLabel];
    dateLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:dateLabel];

    UIImageView *myImageView = [[UIImageView alloc] initWithImage:[details image]];
    [myImageView setFrame:imageRect];
    myImageView.layer.cornerRadius = 5;
    //    view.clipsToBounds = YES;
    myImageView.layer.masksToBounds = YES;
    [view addSubview:myImageView];

    [self.view addSubview:view];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
